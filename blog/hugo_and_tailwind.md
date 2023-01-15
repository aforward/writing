# Installing Hugo with Tailwind CSS
#meta datetime 2022-09-14
#meta tags[] hugo tailwindcss

## Summary

![Hugo and Tailwind CSS homepage](hugo_and_tailwind/html.jpg)

I was experimenting with [Hugo](https://gohugo.io)
as a static site generator for a project.  Despite
not going forward with that tech (we landed on GitHub
pages), here are my notes on getting it up and runnning.

All code is available on [GitHub at /work-samples/hugo-and-tailwindcss](https://github.com/work-samples/hugo-and-tailwindcss)

## Article

I was experimenting with [Hugo](https://gohugo.io)
as a static site generator for a project.  Despite
not going forward with that tech (we landed on GitHub
pages), here are my notes on getting it up and runnning.

All code is available on [GitHub at /work-samples/hugo-and-tailwindcss](https://github.com/work-samples/hugo-and-tailwindcss)

## Installing Hugo with Tailwind CSS

![Hugo and Tailwind CSS homepage](hugo_and_tailwind/html.jpg)

I was experimenting with [Hugo](https://gohugo.io)
as a static site generator for a project.  Despite
not going forward with that tech (we landed on GitHub
pages), here are my notes on getting it up and runnning.

### Installation

From [gohubo.io](https://gohugo.io/getting-started/installing/)
you will find many ways to install hugo.

For Mac OS X you can use [brew](https://brew.sh) and [ports](https://www.macports.org)

```bash
brew install hugo
```

### Generating a Hugo Project

You can build a base site using
We built the base site using

```
hugo new site homepage
```

But then added a [.gitignore](https://github.com/github/gitignore/blob/main/community/Golang/Hugo.gitignore)
to ensure we leave out the unnecessary stuff (also show below).

```bash
# Generated files by hugo
/public/
/resources/_gen/
/assets/jsconfig.json
hugo_stats.json

# Executable may be added to repository
hugo.exe
hugo.darwin
hugo.linux

# Temporary lock file while building
/.hugo_build.lock
```

### Enabling Tailwind CSS

Following [Using Hugo with Tailwind CSS 2](https://www.wimdeblauwe.com/blog/2021/01/18/using-hugo-with-tailwind-css-2/)
and [Hugo and Tailwind CSS 3.0](https://www.hugotutorial.com/posts/2022-01-03-hugo-and-tailwindcss-3.0/)
we configured the site with Tailwind CSS using the following commands

```bash
npm init -y
npm install -D --save-exact autoprefixer postcss postcss-cli postcss-import tailwindcss
```

Update your `.gitignore` to exclude the dependency directories

```
# Dependency directories
node_modules/
```

Create a `postcss.config.js`

```javascript
module.exports = {
 plugins: {
   tailwindcss: {},
   autoprefixer: {}
 }
}
```

Initialize tailwindcss

```bash
npx tailwindcss init
```

Update the `purge` in `tailwind.config.js`

```javascript
/** @type {import('tailwindcss').Config} */
module.exports = {
 purge: ['layouts/**/*.html'],
 content: ["./content/**/*.{html,js}", "./layouts/**/*.{html,js}"],
 theme: {
   extend: {},
 },
 plugins: [],
}
```

Create a `assets/css/app.css` file with

```css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

Create a `layouts/_default/baseof.html` file with

```html
<!DOCTYPE html>
<html lang="{{ .Language.Lang }}">
<head>
   {{ partial "head.html" . }}
</head>
<body>
{{ block "main" . }}{{ end }}
{{ partial "footer.html" . }}
</body>
</html>
```

Create a `layouts/_default/index.html` file with

```html
{{ define "main" }}
 <main class="mx-auto px-4 py-24 bg-gray-100">
   <h1>Welcome to Hugo with Tailwind CSS</h1>
   <div class="text-gray-500">This is an example site with Tailwind CSS 2</div>
 </main>
{{ end }}
```

Create a `layouts/partials/head.html` file with

```html
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

{{ $styles := resources.Get "css/app.css" | postCSS }}

{{ if .Site.IsServer }}
 <link rel="stylesheet" href="{{ $styles.RelPermalink }}"/>
{{ else }}
 {{ $styles := $styles | minify | fingerprint | resources.PostProcess }}
 <link rel="stylesheet" href="{{ $styles.RelPermalink }}" integrity="{{ $styles.Data.Integrity }}"/>
{{ end }}
```

Create a `layouts/partials/footer.html` file with

```html
<footer class="bg-gray-900">
 <div class="flex justify-center text-white py-1">This is the footer</div>
</footer>
```

Finally, create an empty `layouts/_default/taxonomy.html` file.


Now you can run the base site with

```bash
hugo server
```
