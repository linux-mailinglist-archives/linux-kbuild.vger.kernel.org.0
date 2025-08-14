Return-Path: <linux-kbuild+bounces-8468-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA6BB26752
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 15:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A1FD16AC6A
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Aug 2025 13:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C0202EA72D;
	Thu, 14 Aug 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loBIPTV7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B670318157;
	Thu, 14 Aug 2025 13:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755178018; cv=none; b=cF0EgemY/lu3b2z7HRbePpme6hdbH2HtyKwpUXjCcEe+LeeWokCrgX1jaavEjfpNUUN0uNP7D+2S0SOWafIHME9nJsndgl4h6WNAMYLKKJqoMUkkh56hLj7HKUg6mfFLAj3Y9X3vG9zYJNBQmtGynW1cXSCw08x5yUDjs+MJoYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755178018; c=relaxed/simple;
	bh=OUQZvJYCkZKLwdEROPy8zW4ENvsw64QAg/kb1304moY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=Dh2APBPAzc609JKTxIiqWE/Hb49F2Vy9W+LZgq5EI+W8LAyswiCd7JnbxzVei4moh10zNQwt38/MRN+U2F06VDDBjC0Tm2jJwYpu84/CPtPVlOXsPcaaO9+nmWRtpjVkvu9uwnfBqEiNXJrN2e32FniOWz8ioJueUxnJrIILSKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loBIPTV7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F0EC4CEED;
	Thu, 14 Aug 2025 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755178018;
	bh=OUQZvJYCkZKLwdEROPy8zW4ENvsw64QAg/kb1304moY=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=loBIPTV7oLiZ8zmC0UPh8cYWu7Je1mXCKhtVT7gHQva+7wS7oE/ZVz3R/w6CyzxI6
	 ONHsfvqlWb1s2Cgx78mktMTCfniP2SXZtBe+ZnAmPtkNpwllw8rzigjAyacXofMOAz
	 iReMDWswXpeVLYkebuIO/QfAOal23iyRMLe2a9Xra1XQOv7wDJou1l6Xb/3jh9F/Rg
	 6LEVcKWVsthLftK8NpDIw2+5LQPfYkMwgczKXjeUZh1Lb/+dfrVdBwPTysFgxJPKxU
	 S0/jm5BKvhJs0O2eFlzMt6T+j8ThmP/vtCQ5UfTLzxLUCFUIQx8my9Bd0J837RdR6R
	 vQ52Yj+cOQeTQ==
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 15:26:53 +0200
Message-Id: <DC26OG2L7OMH.31RE7460D4DHU@kernel.org>
To: "Alexey Gladkov" <legion@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 6/9] modpost: Add modname to mod_device_table alias
Cc: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas.schier@linux.dev>, "Masahiro Yamada" <masahiroy@kernel.org>, "Petr
 Pavlu" <petr.pavlu@suse.com>, "Luis Chamberlain" <mcgrof@kernel.org>, "Sami
 Tolvanen" <samitolvanen@google.com>, "Daniel Gomez" <da.gomez@samsung.com>,
 <linux-kernel@vger.kernel.org>, <linux-modules@vger.kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>,
 <rust-for-linux@vger.kernel.org>
References: <cover.1755170493.git.legion@kernel.org>
 <15724fb8669dae64e3c8d31ab620f977984b2177.1755170493.git.legion@kernel.org>
In-Reply-To: <15724fb8669dae64e3c8d31ab620f977984b2177.1755170493.git.legion@kernel.org>

On Thu Aug 14, 2025 at 3:07 PM CEST, Alexey Gladkov wrote:
> At this point, if a symbol is compiled as part of the kernel,
> information about which module the symbol belongs to is lost.
>
> To save this it is possible to add the module name to the alias name.
> It's not very pretty, but it's possible for now.
>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: Andreas Hindborg <a.hindborg@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Alex Gaynor <alex.gaynor@gmail.com>
> Cc: rust-for-linux@vger.kernel.org
> Signed-off-by: Alexey Gladkov <legion@kernel.org>
> ---
>  include/linux/module.h   | 14 +++++++++++++-
>  rust/kernel/device_id.rs |  8 ++++----
>  scripts/mod/file2alias.c | 18 ++++++++++++++----
>  3 files changed, 31 insertions(+), 9 deletions(-)
>
> diff --git a/include/linux/module.h b/include/linux/module.h
> index 3319a5269d28..e31ee29fac6b 100644
> --- a/include/linux/module.h
> +++ b/include/linux/module.h
> @@ -244,10 +244,22 @@ struct module_kobject *lookup_or_create_module_kobj=
ect(const char *name);
>  /* What your module does. */
>  #define MODULE_DESCRIPTION(_description) MODULE_INFO(description, _descr=
iption)
> =20
> +/*
> + * Format: __mod_device_table__kmod_<modname>__<type>__<name>
> + * Parts of the string `__kmod_` and `__` are used as delimiters when pa=
rsing
> + * a symbol in file2alias.c
> + */
> +#define __mod_device_table(type, name)	\
> +	__PASTE(__mod_device_table__,	\
> +	__PASTE(__KBUILD_MODNAME,	\
> +	__PASTE(__,			\
> +	__PASTE(type,			\
> +	__PASTE(__, name)))))
> +
>  #ifdef MODULE
>  /* Creates an alias so file2alias.c can find device table. */
>  #define MODULE_DEVICE_TABLE(type, name)					\
> -static typeof(name) __mod_device_table__##type##__##name		\
> +static typeof(name) __mod_device_table(type, name)			\
>    __attribute__ ((used, alias(__stringify(name))))
>  #else  /* !MODULE */
>  #define MODULE_DEVICE_TABLE(type, name)
> diff --git a/rust/kernel/device_id.rs b/rust/kernel/device_id.rs
> index 70d57814ff79..62c42da12e9d 100644
> --- a/rust/kernel/device_id.rs
> +++ b/rust/kernel/device_id.rs
> @@ -195,10 +195,10 @@ macro_rules! module_device_table {
>      ($table_type: literal, $module_table_name:ident, $table_name:ident) =
=3D> {
>          #[rustfmt::skip]
>          #[export_name =3D
> -            concat!("__mod_device_table__", $table_type,
> -                    "__", module_path!(),
> -                    "_", line!(),
> -                    "_", stringify!($table_name))
> +            concat!("__mod_device_table__", line!(),

Why do we have line!() between "__mod_device_table__" and "__kmod_", while =
the
format is defined as "__mod_device_table__kmod_<modname>__<type>__<name>" a=
bove?

The previous logic was to create a unique name with
using "<module_path>_<line>_<table_name>" as "<name>". So, I think this sho=
uld
actually be:

	concat!("__mod_device_table__kmod_",
		module_path!(),
		"__", $table_type,
		"__", stringify!($table_name),
		"_", line!())

rather than the below.

> +                    "__kmod_", module_path!(),
> +                    "__", $table_type,
> +                    "__", stringify!($table_name))
>          ]
>          static $module_table_name: [::core::mem::MaybeUninit<u8>; $table=
_name.raw_ids().size()] =3D
>              unsafe { ::core::mem::transmute_copy($table_name.raw_ids()) =
};

