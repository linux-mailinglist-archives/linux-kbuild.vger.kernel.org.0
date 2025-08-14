Return-Path: <linux-kbuild+bounces-8470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3FB2685A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 16:01:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65AFC9E32B7
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01E63009EE;
	Thu, 14 Aug 2025 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L96298qW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9FA3002CA;
	Thu, 14 Aug 2025 13:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755179705; cv=none; b=AjXFHxLHCv3SrDF3txm7yHHkj8YDDWDLwV3LumRvCBFUlZK+o9AB7a6YvBqXbONH1QZEocp4ciA6CqjExj4a3LOZWMtdb5IalQuF7lS9XhfWCeaKy8JennWZdaqdeay3+M3IzrLBvhJ3vL0SIrDodTWaVewriIR7UHKWrq8CDX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755179705; c=relaxed/simple;
	bh=wJBR/EaYTXwijxHpkgGn8AQZgr4/iDw3hs8xh7J5ZOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqJzKnjDuTMj4cVkxHY+S1uqkZb3FTB4GQOvw7pgnlwm4X0kKufc4FHmxMGPDyCYzKRxEPtMn9qGhY0ED0aiUhHDDOmKhsMgJs4MEGTUhNiv4F6zHhwAkf6RSggBxVKg7Zxgek/dY1FY9lN0SeHq6468qfd/ZmwBf46QMJ+AgB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L96298qW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB0F7C4CEED;
	Thu, 14 Aug 2025 13:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755179705;
	bh=wJBR/EaYTXwijxHpkgGn8AQZgr4/iDw3hs8xh7J5ZOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L96298qWRIWg+8SUbaM70XESVPC+Xpc4g1RZ2nneeMQyASegwyXvqQxTLS1jcngOg
	 ERQCsY0hMgLf9fPpvHE0ac74Iud2EkcdVrgiq8Iw7XackA/Hd0zj/QqG2T5Vux/wA2
	 xefkHdt8P1YdHKtSRPHNcl4NjzePdZzKtG3sR0UIhGKSOTr9kUx6vUgCU+76ocLvRA
	 zM3w+PRJYqMGGGhjBVTKi/wgatl33n8OiEl89fwUhFxIYiOa6LJ/TzKcsT058KawSo
	 +Q0SWgD1+tshObZIzpVIkM5JQlR58CiJtq7RiGaCCFYWjXIww21FNZejN0rrOKG4ow
	 kZ9aLOcO6d7fA==
Date: Thu, 14 Aug 2025 15:54:58 +0200
From: Alexey Gladkov <legion@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Miguel Ojeda <ojeda@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 6/9] modpost: Add modname to mod_device_table alias
Message-ID: <aJ3qsonmvUUErQx9@example.org>
References: <cover.1755170493.git.legion@kernel.org>
 <15724fb8669dae64e3c8d31ab620f977984b2177.1755170493.git.legion@kernel.org>
 <DC26OG2L7OMH.31RE7460D4DHU@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DC26OG2L7OMH.31RE7460D4DHU@kernel.org>

On Thu, Aug 14, 2025 at 03:26:53PM +0200, Danilo Krummrich wrote:
> On Thu Aug 14, 2025 at 3:07 PM CEST, Alexey Gladkov wrote:
> > At this point, if a symbol is compiled as part of the kernel,
> > information about which module the symbol belongs to is lost.
> >
> > To save this it is possible to add the module name to the alias name.
> > It's not very pretty, but it's possible for now.
> >
> > Cc: Miguel Ojeda <ojeda@kernel.org>
> > Cc: Andreas Hindborg <a.hindborg@kernel.org>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: Alex Gaynor <alex.gaynor@gmail.com>
> > Cc: rust-for-linux@vger.kernel.org
> > Signed-off-by: Alexey Gladkov <legion@kernel.org>
> > ---
> >  include/linux/module.h   | 14 +++++++++++++-
> >  rust/kernel/device_id.rs |  8 ++++----
> >  scripts/mod/file2alias.c | 18 ++++++++++++++----
> >  3 files changed, 31 insertions(+), 9 deletions(-)
> >
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 3319a5269d28..e31ee29fac6b 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -244,10 +244,22 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
> >  /* What your module does. */
> >  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _description)
> >  
> > +/*
> > + * Format: __mod_device_table__kmod_<modname>__<type>__<name>
> > + * Parts of the string `__kmod_` and `__` are used as delimiters when parsing
> > + * a symbol in file2alias.c
> > + */
> > +#define __mod_device_table(type, name)	\
> > +	__PASTE(__mod_device_table__,	\
> > +	__PASTE(__KBUILD_MODNAME,	\
> > +	__PASTE(__,			\
> > +	__PASTE(type,			\
> > +	__PASTE(__, name)))))
> > +
> >  #ifdef MODULE
> >  /* Creates an alias so file2alias.c can find device table. */
> >  #define MODULE_DEVICE_TABLE(type, name)					\
> > -static typeof(name) __mod_device_table__##type##__##name		\
> > +static typeof(name) __mod_device_table(type, name)			\
> >    __attribute__ ((used, alias(__stringify(name))))
> >  #else  /* !MODULE */
> >  #define MODULE_DEVICE_TABLE(type, name)
> > diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> > index 70d57814ff79..62c42da12e9d 100644
> > --- a/rust/kernel/device_id.rs
> > +++ b/rust/kernel/device_id.rs
> > @@ -195,10 +195,10 @@ macro_rules! module_device_table {
> >      ($table_type: literal, $module_table_name:ident, $table_name:ident) => {
> >          #[rustfmt::skip]
> >          #[export_name =
> > -            concat!("__mod_device_table__", $table_type,
> > -                    "__", module_path!(),
> > -                    "_", line!(),
> > -                    "_", stringify!($table_name))
> > +            concat!("__mod_device_table__", line!(),
> 
> Why do we have line!() between "__mod_device_table__" and "__kmod_", while the
> format is defined as "__mod_device_table__kmod_<modname>__<type>__<name>" above?

The "__mod_device_table__" is used to filter symbols.
The meaning part starts after "__kmod_" part. After that, order becomes
important.

> The previous logic was to create a unique name with
> using "<module_path>_<line>_<table_name>" as "<name>". So, I think this should
> actually be:
> 
> 	concat!("__mod_device_table__kmod_",
> 		module_path!(),
> 		"__", $table_type,
> 		"__", stringify!($table_name),
> 		"_", line!())
> 
> rather than the below.

No. "stringify!($table_name)" should be the last thing in this string.
This is the a symbol name that will be searched for in the elf to generate
modalias.

> 
> > +                    "__kmod_", module_path!(),
> > +                    "__", $table_type,
> > +                    "__", stringify!($table_name))
> >          ]
> >          static $module_table_name: [::core::mem::MaybeUninit<u8>; $table_name.raw_ids().size()] =
> >              unsafe { ::core::mem::transmute_copy($table_name.raw_ids()) };
> 

-- 
Rgrds, legion


