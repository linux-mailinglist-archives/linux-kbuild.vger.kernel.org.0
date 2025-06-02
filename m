Return-Path: <linux-kbuild+bounces-7337-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC91ACAA61
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 10:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6BC5189B9CD
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 08:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE481C84B3;
	Mon,  2 Jun 2025 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6a+0y8N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB161C1F12;
	Mon,  2 Jun 2025 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748851625; cv=none; b=m9Omnw7OcpIKAxD57OCr0b/2CMpcHDpL9OEkE3djS9k3VDkMK3h9jIUkgf6dy1k0rK78lry5Dkdv8+MKh5iznDHQT4iAJSJ9gx++7SZW2+KlXQQfOBhymGcz4sDx2QeoNuCN8vjIXcYtQ1gzSG/TJnxflYubNDji+dfXmIUNJCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748851625; c=relaxed/simple;
	bh=ibUuy/MHtU4Gfyd4S79mcShl/L+BhslxFYSgvaGKD3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryJsbG51yktiJAl7W7FftROKxXzRf0ZgV8HQCGFIWMsVHXu1OEtvXRY702VxsJ1Gs8aP+MhDWwer91QaFhjLzcKmT0WDVb4YmkcpsaSGvkg7Tff1TGT/1mPSa4J7ZJ1jIYUNyW4uo3HiymgsTXo6+EafDf/dgYdB6EBTxqG5/8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6a+0y8N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16433C4CEEB;
	Mon,  2 Jun 2025 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748851625;
	bh=ibUuy/MHtU4Gfyd4S79mcShl/L+BhslxFYSgvaGKD3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N6a+0y8NmxZpf6PASWphkkW5rALFtuWQbkD44lrkw1a+gwCTU4mIMtRaTXsv+XhdS
	 J136KshKj3NsYU/cbdpwip2uZ0g5t4kTApyb3mXI6VpBLqZOYlphDE3FIhsjOkbZ41
	 I1HuYBOhLkcnFWNIQGJd9yOw1LsAi82J8vx3lSvTvp0RfyBPfoP4Llm5t0FA0Ik5VT
	 0CsHX2M0Fq1HH3C7b3NABONvVKri6lRb19yP8ThLZ1HlRAG/hlcpdgXrJx8nJrSWa1
	 DK6lJoEFQjtqLQfpb9/mzb6n81r+gSHeEphLTF74Em0N8VQskPPNJ96Ng/L7l6rgz/
	 2XO3zrAdShwfA==
Date: Mon, 2 Jun 2025 10:06:59 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3 3/6] modpost: Make mod_device_table aliases more unique
Message-ID: <aD1bozP0l67f_wbs@example.org>
References: <cover.1748335606.git.legion@kernel.org>
 <ecf0ebdda5bcf82464ed1cebbf50afdcd8b5b23a.1748335606.git.legion@kernel.org>
 <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNARkhc40UfrmmqsqmqkCn60=7zHc=pDFGR4o=k2p7CsABA@mail.gmail.com>

On Mon, Jun 02, 2025 at 04:45:36PM +0900, Masahiro Yamada wrote:
> On Tue, May 27, 2025 at 6:08 PM Alexey Gladkov <legion@kernel.org> wrote:
> >
> > In order to avoid symbol conflicts if they appear in the same binary, a
> > more unique alias identifier can be generated.
> 
> Why must this be unique?
> 
> What problem would happen if the same symbol names
> appear in MODULE_DEVICE_TABLE()?

Before these patches this was not a problem as non-unique characters are
in separate object files when the module is compiled separately.

But when the modules are compiled into the kernel, there is a symbol
conflict when linking vmlinuz. We have modules that export multiple device
tables from different object files.

> 
> >
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> > ---
> >  include/linux/module.h   | 14 ++++++++++++--
> >  scripts/mod/file2alias.c | 18 ++++++++++++++----
> >  2 files changed, 26 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 88048561360f..e7506684069d 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -249,10 +249,20 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
> >  /* What your module does. */
> >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
> >
> > +/* Format: __mod_device_table__<counter>__kmod_<modname>__<type>__<name> */
> > +#define __mod_device_table(type, name) \
> > +       __PASTE(__mod_device_table__,   \
> > +       __PASTE(__COUNTER__,            \
> > +       __PASTE(__,                     \
> > +       __PASTE(__KBUILD_MODNAME,       \
> > +       __PASTE(__,                     \
> > +       __PASTE(type,                   \
> > +       __PASTE(__, name)))))))
> > +
> >  #ifdef MODULE
> >  /* Creates an alias so file2alias.c can find device table. */
> > -#define MODULE_DEVICE_TABLE(type, name)                                        \
> > -extern typeof(name) __mod_device_table__##type##__##name               \
> > +#define MODULE_DEVICE_TABLE(type, name)                        \
> > +extern typeof(name) __mod_device_table(type, name)     \
> >    __attribute__ ((unused, alias(__stringify(name))))
> >  #else  /* !MODULE */
> >  #define MODULE_DEVICE_TABLE(type, name)
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index 00586119a25b..dff1799a4c79 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -1476,8 +1476,8 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
> >  {
> >         void *symval;
> >         char *zeros = NULL;
> > -       const char *type, *name;
> > -       size_t typelen;
> > +       const char *type, *name, *modname;
> > +       size_t typelen, modnamelen;
> >         static const char *prefix = "__mod_device_table__";
> >
> >         /* We're looking for a section relative symbol */
> > @@ -1488,10 +1488,20 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
> >         if (ELF_ST_TYPE(sym->st_info) != STT_OBJECT)
> >                 return;
> >
> > -       /* All our symbols are of form __mod_device_table__<type>__<name>. */
> > +       /* All our symbols are of form __mod_device_table__<counter>__kmod_<modname>__<type>__<name>. */
> >         if (!strstarts(symname, prefix))
> >                 return;
> > -       type = symname + strlen(prefix);
> > +
> > +       modname = strstr(symname, "__kmod_");
> > +       if (!modname)
> > +               return;
> > +       modname += strlen("__kmod_");
> > +
> > +       type = strstr(modname, "__");
> > +       if (!type)
> > +               return;
> > +       modnamelen = type - modname;
> > +       type += strlen("__");
> >
> >         name = strstr(type, "__");
> >         if (!name)
> > --
> > 2.49.0
> >
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 

-- 
Rgrds, legion


