Return-Path: <linux-kbuild+bounces-6778-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF7AA07F4
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 12:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8130F1B60165
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 10:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1678293453;
	Tue, 29 Apr 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnBSuLn9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A111FE478;
	Tue, 29 Apr 2025 10:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745921085; cv=none; b=r1ZRSlQ9c5wHv2S8lN9fzcfn375G2hjrPPsxgb0K2HzSP1x84Vw5Q930iIeMy42kxhKuJn/COx1qczwchEKq2bHXevw2LJIiG8xuJAhLN15Nic0jHo5CEhJSJdiX1tbN0CmzPmL55zcmzhwSkMqtOGQE+TnlisDAcnle8Y21iAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745921085; c=relaxed/simple;
	bh=ggnZ9rB4L/OHC4j1OJGJrTPWEDDVBgLNqAzq6M93a+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QOuRxvYDTWchc2dsQqwAmCBC8T0VjV04dx41nTqh2OvFbYg6zXl+SqKS1lOBwWJ+UDixgs/xeVqmBDidZgzZkxo1b70PWHO/HZXginyqGz7CezoFV9vN7cXnmVpxTpPcg3WE6EkD7oRG3PF8F2RjcOUMtvyWmZI+a7448YBk6LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnBSuLn9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB09C4CEE3;
	Tue, 29 Apr 2025 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745921084;
	bh=ggnZ9rB4L/OHC4j1OJGJrTPWEDDVBgLNqAzq6M93a+U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnBSuLn9Rb+kmgRen/PdoU7YoxcW1XGpp1oic6H9IJ8AlavhfdqQ+/9Rfv5J+z6CM
	 ZssYFjuPuGzlTUU30RmMmUS3mlwEBUvJ832E8UGH4+LktIiRI0es3DSVdzLks1mTzF
	 VJEfsffhgzMxcJ6AWXgyRePU1QheVhGR6ocn16mHuNWjAaWpy1ax7YAfBaDwJoNiXj
	 emOnwIif4B4Yc9/S3eVF5mq7agx7mVZSarxR5HrbqfCfbvpnTYzZnn+Qz+bkGeuB+R
	 1HdFhIUlhwkKILB8V/Qfy+On1HWgHhAZYumkOg6tAXBYpiYaI5RsiENSCq+gjzLb/y
	 px1P0Ct8hPEAw==
Date: Tue, 29 Apr 2025 12:04:38 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v1 5/7] modpost: Create modalias for builtin modules
Message-ID: <aBCkNh0Q2hwpMchj@example.org>
References: <cover.1745591072.git.legion@kernel.org>
 <bb0d887760a474e5e7f9db0e9933eee81a5d9ea3.1745591072.git.legion@kernel.org>
 <cf3ff619-6177-42e1-8f64-74cf4cbb8672@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf3ff619-6177-42e1-8f64-74cf4cbb8672@suse.com>

On Tue, Apr 29, 2025 at 11:25:47AM +0200, Petr Pavlu wrote:
> On 4/26/25 18:16, Alexey Gladkov wrote:
> > For some modules, modalias is generated using the modpost utility and
> > the section is added to the module file.
> > 
> > When a module is added inside vmlinux, modpost does not generate
> > modalias for such modules and the information is lost.
> > 
> > As a result kmod (which uses modules.builtin.modinfo in userspace)
> > cannot determine that modalias is handled by a builtin kernel module.
> > 
> > $ cat /sys/devices/pci0000:00/0000:00:14.0/modalias
> > pci:v00008086d0000A36Dsv00001043sd00008694bc0Csc03i30
> > 
> > $ modinfo xhci_pci
> > name:           xhci_pci
> > filename:       (builtin)
> > license:        GPL
> > file:           drivers/usb/host/xhci-pci
> > description:    xHCI PCI Host Controller Driver
> > 
> > Missing modalias "pci:v*d*sv*sd*bc0Csc03i30*" which will be generated by
> > modpost if the module is built separately.
> > 
> > To fix this it is necessary to generate the same modalias for vmlinux as
> > for the individual modules. Fortunately '.vmlinux.export.o' is already
> > generated from which '.modinfo' can be extracted in the same way as for
> > vmlinux.o.
> > 
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > ---
> >  include/linux/module.h   |  4 ----
> >  scripts/mod/file2alias.c | 13 ++++++++++++-
> >  scripts/mod/modpost.c    | 21 ++++++++++++++++++---
> >  scripts/mod/modpost.h    |  7 ++++++-
> >  4 files changed, 36 insertions(+), 9 deletions(-)
> > 
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 7250b4a527ec..6225793ddcd4 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -257,14 +257,10 @@ extern void cleanup_module(void);
> >  	__PASTE(type,			\
> >  	__PASTE(__, name)))))))
> >  
> > -#ifdef MODULE
> >  /* Creates an alias so file2alias.c can find device table. */
> >  #define MODULE_DEVICE_TABLE(type, name)			\
> >  extern typeof(name) __mod_device_table(type, name)	\
> >    __attribute__ ((unused, alias(__stringify(name))))
> > -#else  /* !MODULE */
> > -#define MODULE_DEVICE_TABLE(type, name)
> > -#endif
> >  
> >  /* Version of form [<epoch>:]<version>[-<extra-version>].
> >   * Or for CVS/RCS ID version, everything but the number is stripped.
> > diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
> > index dff1799a4c79..0fa3f031b904 100644
> > --- a/scripts/mod/file2alias.c
> > +++ b/scripts/mod/file2alias.c
> > @@ -1471,7 +1471,8 @@ static const struct devtable devtable[] = {
> >  /* Create MODULE_ALIAS() statements.
> >   * At this time, we cannot write the actual output C source yet,
> >   * so we write into the mod->dev_table_buf buffer. */
> > -void handle_moddevtable(struct module *mod, struct elf_info *info,
> > +void handle_moddevtable(struct list_head *modules,
> > +			struct module *mod, struct elf_info *info,
> >  			Elf_Sym *sym, const char *symname)
> >  {
> >  	void *symval;
> 
> The new modules parameter is unused.

Indeed. It is no longer needed after the optimization. Thank you.

> > @@ -1509,6 +1510,16 @@ void handle_moddevtable(struct module *mod, struct elf_info *info,
> >  	typelen = name - type;
> >  	name += strlen("__");
> >  
> > +	if (mod->is_vmlinux) {
> > +		struct module *builtin_mod;
> > +
> > +		builtin_mod = new_module(modname, modnamelen);
> > +		builtin_mod->is_vmlinux = mod->is_vmlinux;
> > +		builtin_mod->dump_file = MODULE_BUILTIN_FNAME;
> 
> The module.dump_file member is described in scripts/mod/modpost.h as
> "path to the .symvers file if loaded from a file". However, that is not
> the case here.
> 
> Similarly, the module struct in scripts/mod/modpost.h is commented as
> "represent a module (vmlinux or *.ko)", but this patch expands its scope
> to also include builtin modules.

Well, an alternative would be to add a separate flag. I used dump_file
because it allows you to exclude such "builtin" modules from processing in
write_dump(), write_namespace_deps_files(), etc.

But yes, I agree that it's an abuse.

> I'm not sure it's best to overload this data in this way. I think mixing
> actual files and "logical" modules in the modules list is somewhat
> confusing.
> 
> An alternative would be to keep a single module struct for vmlinux and
> record the discovered aliases under it?

It is possible to extend struct module_alias and add the module name. The
problem is that alias is added by module_alias_printf() and we will have
to add the module name to the arguments to each do_entry handler in
addition to struct module where there is already a name (but in our case
it is vmlinux).

I can do that if you think it's a better way.

-- 
Rgrds, legion


