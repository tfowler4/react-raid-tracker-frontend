# base image
FROM node:18-alpine AS base

# install dependencies
FROM base AS deps

# install packages with no cache
RUN apk add --no-cache libc6-compat

# set folder
WORKDIR /app
COPY package.json ./
RUN npm update && npm install

# Rebuild the source code only when needed
FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

# build the code
RUN npm run build

FROM base AS runner
WORKDIR /app
ENV NODE_ENV production

#creates a system group named nodejs 
RUN addgroup --system --gid 1001 nodejs

#creates a system group named nextjs 
RUN adduser --system --uid 1001 nextjs


#copy the file from to public folder 
COPY --from=builder /app/public ./public

#  set permissions for prerender cache
RUN mkdir .next
RUN chown nextjs:nodejs .next

# utilize smaller image size
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

USER nextjs

# ex: EXPOSE <port>
EXPOSE 3000

# set Environment port
ENV PORT 3000

# run server.js from standalone output
CMD ["node", "server.js"]