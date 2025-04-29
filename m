Return-Path: <linux-kbuild+bounces-6795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A473FAA0E89
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 16:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3A911BA0743
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 14:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5941C212B28;
	Tue, 29 Apr 2025 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g45me7DC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD8F3987D
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Apr 2025 14:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936060; cv=none; b=X0XBv0E1EAFbDL8at5O6PpUMqIt8EjduZknvf4zKvZkMu7HSE1MMaNKpH3X87vv8cpqsNPZNMWQ/c7yh7xokSb1M9pueX0gkYef3z8IJ7yypo1/151H0iDFBwrOD7OH6Wu47K5s0dcWkO/+fYoVWXf3Wy9+7ECus52tHUB97snE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936060; c=relaxed/simple;
	bh=/Bic5tMQbn4e9l13Gx+2H4VKZnvHe4be2dvQJf6n6vc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fAQz8eF++TMMr7eijHGQ2DOtc7ZVFZjTvcKvqNAO01WqouzfML8O1hBugnXtgs16cr3AakidK5QAF46CpSGkSPYO5QJ87MY1JvXNidEndJ2q9V9tGMlMWcAnB9C7cUCQldaNtuG+OwNoodUFzN+AgZofhroK6PbpzVhhJ7/p/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g45me7DC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac34257295dso1030585666b.2
        for <linux-kbuild@vger.kernel.org>; Tue, 29 Apr 2025 07:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745936055; x=1746540855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QU733MoFmkvJlcQMMp1av039eQ89ojsIQoVLgnbBgjE=;
        b=g45me7DCtmyhpCozfisO74fstponHUSjvYPtdw9SohFiaGmk6Mt3KuE+201uVYEsrm
         dihDcB5uhwkSZVpx+6ZPg/wyW4KvFGwdedFWfgNJoE3Ma3CfIZ9kkxfjkMLnjY+SMQQ0
         jUJkUsxNbx+f6lv8hExnyYnLhY1i830kRya2nSuKevZ5EnFupA5fXiMglpjuwed1WxyZ
         cFYOd0fXTcLGBwhnoqGUbJN8eal0/8Ay9n1tpq+qdOuyE/8V1VFciAoSUWBwY2tJ/HI2
         U5KL/GsfS14VvxOV9tae/tmBGQFk+B6KnhBwOqzmyQROItxC/8Zbqi2GaLO7N26dFGkg
         uHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936055; x=1746540855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QU733MoFmkvJlcQMMp1av039eQ89ojsIQoVLgnbBgjE=;
        b=QlwJbbFbXU8up26lfey+Pw4FJkgUKZ03scYFl5jp1zf54nsp+lj14+vBTTXWkvuJYF
         K12hd//ttF8HXyZA+CyoILrz7VdHc1mzzcGbqG27Rf4a99aXtxLExXUiLXyK7Y/rSjAd
         3zgkWDsPa9ulGYEBpu+jNDDy9/hU9K3Rcd2PZEFLmW7ghuCtNwrXG5IUZfc4JpFjgf/l
         FjIMmD/uy2VBXvMGI889h7O+XdFXZqnBSeMFtqq3uWDwUY/KH7hkqe50GigOj83M00wH
         C6P29oBDRMBKZ6U/GDZaNbAPCG3f/5jzst7GlaEapAiRNMk9LZ+IsR7v+WUDGA6k1AIn
         lU5w==
X-Forwarded-Encrypted: i=1; AJvYcCUENbS19hbQ+uymYM1J/H5CM4g8P+yZQc/ZWMTyVheBZKx0A8CE8VjTHq6udC+Qc+hOt5Je99NH3nnLIhs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlcunCfNPB886dAhDkMjQIgdVFDLySDUsQGCJRQVbzBmocoOAy
	hx1xSOKB3Oc/iBF+CA3XtwnX6+eWrTXZJ8E+hJ/V2n/x+6DjvPSkDmI6iobP9AU=
X-Gm-Gg: ASbGnctHJP79TzOvGVUs0j1+fR0v2GoapIgM24btW7hPedOk/7L4GcPMpHBOwJC3nR6
	3wq+HVBRItrxRMSl8nXURsBZhpMR4U2Y/pmU8TQqFL8I2mc1X9kOt6vM0dplTFJvC9eXNX/i/NE
	3MonS3bhF7KoxwjqJ9qsXrfFbETjE5SHgtMe/nBDNkY/lz7JhtsuKbBr/pLZWryb4OZrFmOr9zt
	6oONbgaZv7FFHRbZPm6F5hLg1hBDS1WgV7YetFvatS2N2HAHGKu29MS+Ig9h5YC4QMwFojaPskk
	p/IPpkqdB5/HJCuf2OinnLy59LskyTFZTi43m1NqRDY=
X-Google-Smtp-Source: AGHT+IEP+h6/ELvWESlBbC9Pz4Pr39fyYlZm3Lx8N+sfkjC9Cz4qRUIr4fHaPTtWKEstTwDU0myT1w==
X-Received: by 2002:a17:907:2d2c:b0:ac2:baab:681c with SMTP id a640c23a62f3a-acec4e41bb2mr443404066b.28.1745936055090;
        Tue, 29 Apr 2025 07:14:15 -0700 (PDT)
Received: from [10.100.51.48] ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec9e47497sm112320666b.160.2025.04.29.07.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 07:14:14 -0700 (PDT)
Message-ID: <7b13da9f-39f2-4007-931b-519d8e7d1ab6@suse.com>
Date: Tue, 29 Apr 2025 16:14:13 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/7] modpost: Create modalias for builtin modules
To: Alexey Gladkov <legion@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez
 <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>, linux-kernel@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org
References: <cover.1745591072.git.legion@kernel.org>
 <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
 <cf3ff619-6177-42e1-8f64-74cf4cbb8672@suse.com>
 <aBCkNh0Q2hwpMchj@example.org> <aBDK0G6OUUcEmzvZ@example.org>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <aBDK0G6OUUcEmzvZ@example.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/29/25 14:49, Alexey Gladkov wrote:
> On Tue, Apr 29, 2025 at 12:04:44PM +0200, Alexey Gladkov wrote:
>>> I'm not sure it's best to overload this data in this way. I think mixing
>>> actual files and "logical" modules in the modules list is somewhat
>>> confusing.
>>>
>>> An alternative would be to keep a single module struct for vmlinux and
>>> record the discovered aliases under it?
>>
>> It is possible to extend struct module_alias and add the module name. The
>> problem is that alias is added by module_alias_printf() and we will have
>> to add the module name to the arguments to each do_entry handler in
>> addition to struct module where there is already a name (but in our case
>> it is vmlinux).
>>
>> I can do that if you think it's a better way.
> 
> If I don't add separate entries for each builtin module, the patch will
> look like this:
> [...]

I see, that didn't turn out as well as I envisioned. One more approach
would be to track builtin modules separately. A patch is below. I'm not
sure if it's better.


diff --git a/include/linux/module.h b/include/linux/module.h
index 7250b4a527ec..6225793ddcd4 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -257,14 +257,10 @@ extern void cleanup_module(void);
 	__PASTE(type,			\
 	__PASTE(__, name)))))))
 
-#ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
 #define MODULE_DEVICE_TABLE(type, name)			\
 extern typeof(name) __mod_device_table(type, name)	\
   __attribute__ ((unused, alias(__stringify(name))))
-#else  /* !MODULE */
-#define MODULE_DEVICE_TABLE(type, name)
-#endif
 
 /* Version of form [<epoch>:]<version>[-<extra-version>].
  * Or for CVS/RCS ID version, everything but the number is stripped.
diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index dff1799a4c79..28a4c045f66c 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -1471,8 +1471,8 @@ static const struct devtable devtable[] = {
 /* Create MODULE_ALIAS() statements.
  * At this time, we cannot write the actual output C source yet,
  * so we write into the mod->dev_table_buf buffer. */
-void handle_moddevtable(struct module *mod, struct elf_info *info,
-			Elf_Sym *sym, const char *symname)
+void handle_moddevtable(struct module *mod, struct elf_info *info, Elf_Sym *sym,
+			const char *symname)
 {
 	void *symval;
 	char *zeros = NULL;
@@ -1509,6 +1509,10 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
 	typelen = name - type;
 	name += strlen("__");
 
+	if (mod->is_vmlinux)
+		// XXX Check if the module doesn't already exist?
+		mod = new_module(modname, modnamelen, true);
+
 	/* Handle all-NULL symbols allocated into .bss */
 	if (info->sechdrs[get_secindex(info, sym)].sh_type & SHT_NOBITS) {
 		zeros = calloc(1, sym->st_size);
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index be89921d60b6..f39e3456e021 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -168,9 +168,12 @@ char *get_line(char **stringp)
 	return orig;
 }
 
-/* A list of all modules we processed */
+/* A list of all modules (vmlinux or *.ko) we processed */
 LIST_HEAD(modules);
 
+/* A list of all builtin modules we processed */
+LIST_HEAD(builtin_modules);
+
 static struct module *find_module(const char *filename, const char *modname)
 {
 	struct module *mod;
@@ -183,7 +186,7 @@ static struct module *find_module(const char *filename, const char *modname)
 	return NULL;
 }
 
-static struct module *new_module(const char *name, size_t namelen)
+struct module *new_module(const char *name, size_t namelen, bool is_builtin)
 {
 	struct module *mod;
 
@@ -207,7 +210,10 @@ static struct module *new_module(const char *name, size_t namelen)
 	 */
 	mod->is_gpl_compatible = true;
 
-	list_add_tail(&mod->list, &modules);
+	if (is_builtin)
+		list_add_tail(&mod->list, &builtin_modules);
+	else
+		list_add_tail(&mod->list, &modules);
 
 	return mod;
 }
@@ -1573,7 +1579,7 @@ static void read_symbols(const char *modname)
 	}
 
 	/* strip trailing .o */
-	mod = new_module(modname, strlen(modname) - strlen(".o"));
+	mod = new_module(modname, strlen(modname) - strlen(".o"), false);
 
 	/* save .no_trim_symbol section for later use */
 	if (info.no_trim_symbol_len) {
@@ -2021,11 +2027,23 @@ static void write_if_changed(struct buffer *b, const char *fname)
 static void write_vmlinux_export_c_file(struct module *mod)
 {
 	struct buffer buf = { };
+	struct module_alias *alias, *next;
 
 	buf_printf(&buf,
-		   "#include <linux/export-internal.h>\n");
+		   "#include <linux/export-internal.h>\n"
+		   "#include <linux/module.h>\n");
 
 	add_exported_symbols(&buf, mod);
+
+	list_for_each_entry(mod, &builtin_modules, list) {
+		list_for_each_entry_safe(alias, next, &mod->aliases, node) {
+			buf_printf(&buf, "MODULE_ALIAS_MODNAME(\"%s\", \"%s\");\n",
+					mod->name, alias->str);
+			list_del(&alias->node);
+			free(alias);
+		}
+	}
+
 	write_if_changed(&buf, ".vmlinux.export.c");
 	free(buf.p);
 }
@@ -2114,7 +2132,7 @@ static void read_dump(const char *fname)
 
 		mod = find_module(fname, modname);
 		if (!mod) {
-			mod = new_module(modname, strlen(modname));
+			mod = new_module(modname, strlen(modname), false);
 			mod->dump_file = fname;
 		}
 		s = sym_add_exported(symname, mod, gpl_only, namespace);
diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
index 9133e4c3803f..f2b6d25f00ff 100644
--- a/scripts/mod/modpost.h
+++ b/scripts/mod/modpost.h
@@ -107,7 +107,7 @@ struct module_alias {
 };
 
 /**
- * struct module - represent a module (vmlinux or *.ko)
+ * struct module - represent a module (vmlinux, a builtin module, or *.ko)
  *
  * @dump_file: path to the .symvers file if loaded from a file
  * @aliases: list head for module_aliases
@@ -199,6 +199,8 @@ static inline bool is_valid_name(struct elf_info *elf, Elf_Sym *sym)
 	return !is_mapping_symbol(name);
 }
 
+struct module *new_module(const char *name, size_t namelen, bool is_builtin);
+
 /* symsearch.c */
 void symsearch_init(struct elf_info *elf);
 void symsearch_finish(struct elf_info *elf);

-- 
Cheers,
Petr

