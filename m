Return-Path: <linux-kbuild+bounces-6713-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6DEA9562C
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 20:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 698C5171E94
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Apr 2025 18:53:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BD11EB1AC;
	Mon, 21 Apr 2025 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="QBgCCfBd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FB71EA7EB
	for <linux-kbuild@vger.kernel.org>; Mon, 21 Apr 2025 18:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745261573; cv=none; b=Jz5eLfoyJEhm8aiqKBHuB/H07M6ilCdbm11vi4wIZUyA/cTWTQOy1QDOPSJt3nkY6DA7D3AaSvAe/p0JevXddt8HodRk5fdsEkF0TOQG6uJ4ys7rGvITfEICaheOJYpzFwq3VPm4JDoJzJNxvIsVA7O08N/8sWbs81GoaqM3yFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745261573; c=relaxed/simple;
	bh=MAT6Ew2gJpdMJ8irAU8emiSANZdL6DjJHNFxnFPsi3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ7tChs/atfN5HItoeIXXj0wmWA9Q/bBCyvsTyRMOaFIILM/8f+BNP9HPf0uLp6qJieXEG2RNi0s+r+nElciyDeqf201njESkiGGAmPZ+QIzkz7SDtHgdxeGeexhCi6v3JxrZ5+y3vzkBGUCfPDDB/z3FAsnqGQfe5NUljfX3vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=QBgCCfBd; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e6df1419f94so3248842276.0
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Apr 2025 11:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1745261569; x=1745866369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lz3xUPpEUe/pX3Hqv/1lT4GmPjs/7L4gms/heykjQds=;
        b=QBgCCfBdZ+Y261pLXknquCzeKzGiOf6WfhHPt2eOubBqKoeSWNCbuZat5VWRZCmHlB
         p2hdRfZ9LQz+qqYLKmUZnysoVo6VJm0QITXShrmVsSbBQlNpMSbNNDYIgqXTk/H3SeIY
         zOJyFN9d8HNrYCjZCDNLCAfP+NjkuPDlV9j9qqlD/ajZT0Js+JT0H/Ks4qRmenSCErF5
         xWnQrw9zxvS4qe0ZcMmmKhXs8m6D3fpToPJ1nW7T2WH8DSGv1hH0DDNyfsIXnemSobv2
         gpMvWmjckK4tIFu8T38+ZUQMNq1L4dhqn2XHhUUFpzqtxP/PNx5QcfWoOswf6z8muSS6
         YgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745261569; x=1745866369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lz3xUPpEUe/pX3Hqv/1lT4GmPjs/7L4gms/heykjQds=;
        b=XoqosuKdzHaEheRFu0k1lzX1a38LtGjMTvJIaXJGbnDaP8XNz6hgjHu7EHUQx/kVrl
         QtZNiLKGVQOFFcbW7NqVAAVrLv03DiBN7wQLAJTjuY6NpzAJw1F6C2DsKjDhbktv0j+K
         Bi35mkOrjEMYiug3ecHdkUpsDVO2RaUoY6HfxerXk4fI6a0Lr4JjQMQNGy+LtJA5p/IQ
         mKqjmbl1wGqKQkD7ceb/RuKdJ1oxJUZPzqSEvnGvGmAh2xEOWNs+pAHgwVs3rGkiNkOg
         NRywjkb3mnlexqz5LQzhKmubWQTzcIh9fGfrD7SE1LXN2W0BvxqxYE5/gqooMvcabWMo
         BKcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1HCXQfGs0S2OcamwPNhRMOn6HKGszU7ewhH32isNiGUX3iz2Hw2lef1NytZ1Zq3S0LFO7lWIDpaAr+Yw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsia9iNiIvZZcydQcnbUjZHytasMbXDoN5HeDn4/a35bHtpSx0
	vzU70+CcADd+BYw0X8rCWo7lrJuo4fI5xz4QG/kUNCq50PKapWubF2iWCBrzcWmG2INLDVeyuFr
	lSSu6kbAaaefs72PnfENHnnBPeUNjLSmBvoGk
X-Gm-Gg: ASbGnctEb/ygGNsYiVoEJSGSxfUMD53r70nTx/8e0JMO3Yfdw/Vz7GZh0Mhz+w/UZZD
	W6WWpwHtvqOPE6VQYWClW21Zcs/1d5nBlgO/35Ma5jwb0EbWUWOkepwg2H1Wvp7mw53o4ArSLvO
	7mrYyJgVuZRgGjwohFS8BCGA==
X-Google-Smtp-Source: AGHT+IEuH9hzO8L5xENmqEA5+rCv5QU5f2RwWDzAiO15hUKUo3LnS3Mbacdqm494PthrNYTv96+oKoVST5i5x+eAlHw=
X-Received: by 2002:a05:690c:648a:b0:6fe:abff:cb17 with SMTP id
 00721157ae682-706ccda15f4mr176888017b3.26.1745261569456; Mon, 21 Apr 2025
 11:52:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404215527.1563146-1-bboscaccy@linux.microsoft.com>
 <20250404215527.1563146-2-bboscaccy@linux.microsoft.com> <64859c5c8fd969186c1997a340ed6307e2c70f06.camel@HansenPartnership.com>
In-Reply-To: <64859c5c8fd969186c1997a340ed6307e2c70f06.camel@HansenPartnership.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 21 Apr 2025 14:52:38 -0400
X-Gm-Features: ATxdqUEW2UYysWiho25YbREtPd_DwN7ErCdbG2Ug5RajPR5M9exUr19Bmcv_5Vs
Message-ID: <CAHC9VhSu_tn6d2A4-CYQn_Kr4mdRKEBXLabbPkLZuwQcC2KhJA@mail.gmail.com>
Subject: Re: [PATCH v2 security-next 1/4] security: Hornet LSM
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Blaise Boscaccy <bboscaccy@linux.microsoft.com>, Jonathan Corbet <corbet@lwn.net>, 
	David Howells <dhowells@redhat.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Jan Stancek <jstancek@redhat.com>, Neal Gompa <neal@gompa.dev>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, nkapron@google.com, 
	teknoraver@meta.com, roberto.sassu@huawei.com, xiyou.wangcong@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 2:43=E2=80=AFPM James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> On Fri, 2025-04-04 at 14:54 -0700, Blaise Boscaccy wrote:
> [...]
> > diff --git a/include/linux/kernel_read_file.h
> > b/include/linux/kernel_read_file.h
> > index 90451e2e12bd..7ed9337be542 100644
> > --- a/include/linux/kernel_read_file.h
> > +++ b/include/linux/kernel_read_file.h
> > @@ -14,6 +14,7 @@
> >       id(KEXEC_INITRAMFS, kexec-initramfs)    \
> >       id(POLICY, security-policy)             \
> >       id(X509_CERTIFICATE, x509-certificate)  \
> > +     id(EBPF, ebpf)                          \
>
> This causes a BUILD_BUG_ON for me in security/selinux/hooks.c with
> CONFIG_SECURITY_SELINUX=3Dy because READING_MAX_ID and LOADING_MAX_ID
> become 8.
>
> Below is what I had to do to get the compile to work.

That code was updated during the v6.15 merge window, depending on what
kernel sources Blaise is using for development it's possible he didn't
bump into this even if he was building with SELinux enabled.

Otherwise the changes below look reasonable to me.

> diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
> index e7a7dcab81db..9a7ed0b4b08d 100644
> --- a/security/selinux/hooks.c
> +++ b/security/selinux/hooks.c
> @@ -4133,7 +4133,7 @@ static int selinux_kernel_read_file(struct file *fi=
le,
>  {
>         int rc =3D 0;
>
> -       BUILD_BUG_ON_MSG(READING_MAX_ID > 7,
> +       BUILD_BUG_ON_MSG(READING_MAX_ID > 8,
>                          "New kernel_read_file_id introduced; update SELi=
nux!");
>
>         switch (id) {
> @@ -4158,6 +4158,10 @@ static int selinux_kernel_read_file(struct file *f=
ile,
>                 rc =3D selinux_kernel_load_from_file(file,
>                                                 SYSTEM__X509_CERTIFICATE_=
LOAD);
>                 break;
> +       case READING_EBPF:
> +               rc =3D selinux_kernel_load_from_file(file,
> +                                               SYSTEM__EBPF_LOAD);
> +               break;
>         default:
>                 break;
>         }
> @@ -4169,7 +4173,7 @@ static int selinux_kernel_load_data(enum kernel_loa=
d_data_id id, bool contents)
>  {
>         int rc =3D 0;
>
> -       BUILD_BUG_ON_MSG(LOADING_MAX_ID > 7,
> +       BUILD_BUG_ON_MSG(LOADING_MAX_ID > 8,
>                          "New kernel_load_data_id introduced; update SELi=
nux!");
>
>         switch (id) {
> @@ -4195,6 +4199,10 @@ static int selinux_kernel_load_data(enum kernel_lo=
ad_data_id id, bool contents)
>                 rc =3D selinux_kernel_load_from_file(NULL,
>                                                 SYSTEM__X509_CERTIFICATE_=
LOAD);
>                 break;
> +       case LOADING_EBPF:
> +               rc =3D selinux_kernel_load_from_file(NULL,
> +                                                  SYSTEM__EBPF_LOAD);
> +               break;
>         default:
>                 break;
>         }
> diff --git a/security/selinux/include/classmap.h b/security/selinux/inclu=
de/classmap.h
> index 04a9b480885e..671db23451df 100644
> --- a/security/selinux/include/classmap.h
> +++ b/security/selinux/include/classmap.h
> @@ -65,7 +65,7 @@ const struct security_class_mapping secclass_map[] =3D =
{
>           { "ipc_info", "syslog_read", "syslog_mod", "syslog_console",
>             "module_request", "module_load", "firmware_load",
>             "kexec_image_load", "kexec_initramfs_load", "policy_load",
> -           "x509_certificate_load", NULL } },
> +           "x509_certificate_load", "ebpf_load", NULL } },
>         { "capability", { COMMON_CAP_PERMS, NULL } },
>         { "filesystem",
>           { "mount", "remount", "unmount", "getattr", "relabelfrom",
>

--=20
paul-moore.com

