Return-Path: <linux-kbuild+bounces-13811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9Ge5MCclM2q19wUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13811-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 00:52:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFA869CBF4
	for <lists+linux-kbuild@lfdr.de>; Thu, 18 Jun 2026 00:52:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=google.com header.s=20251104 header.b="gzFzp/zT";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13811-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13811-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=google.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B0E23028B4A
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 22:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8C963B585D;
	Wed, 17 Jun 2026 22:49:59 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA083A4538
	for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 22:49:57 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781736599; cv=pass; b=M2KOKgfsYkiTiJd+Fnx+7SqcRzB1XrKcci7hf9+VqtM5QUZuwHwfqbEy6YYHnH+TL3UEzlvFiLfdFZqTX5o5UxMkPinKw8mPORiE4wTNeUh3vrSgGXQTDh7acDYTEWvziqZ73oc208DxdohziWDdnpgL3xN+CjFus1pFJXYZkCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781736599; c=relaxed/simple;
	bh=jkE+1jyuVEWWG3uziMqtpVHI1kicFJj8ciCjBQ73Ldw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+AjzCQgZ/Qn6q4+D1RRGePvXtUUpuM7YPGYDY0YqdhymUKcpjUq20dciSjLvkYYOghH18/B+h4sB1+kMhYfCLU4uaccHSexBA2WYUqNWrT3V240w7BQYTjYoysPmZXDdwIIdKvJQx/qM/4zS7q8mqwkNZwP/Z6ks2C+ms3LWLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gzFzp/zT; arc=pass smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-695469b574eso2148a12.1
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jun 2026 15:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781736596; cv=none;
        d=google.com; s=arc-20260327;
        b=O9Ejn7H4E8ccfGFph/wNrk1sQkyZrdmaVz+QVS4A5wduU4YGq08EYF6ckS6lo4lvh/
         KL9Pef6Kri+uhZF1KoeZ+g/HlQfiXea1QXz5Yj9mxu2lj+OKno6rUibYE+N3BVq44tqv
         +JWTLtdqSZE7E6cUTdGlpzGSxk459K9+IAe4BzL8LPk3eGf1eoi1gI+YS52LFtV7rxsj
         Fhy1CBximMp7pvzZwb6E5XhnG/kA1HMjYDkrjedJj8uBwXaShuXp6d3ZqsxUIe+RfGZ2
         UAQX/L4Q8hyOxlSMMcr6+0YPYt/fD2fo4ddpHVFx3rJm0N6Ez11poVLA2hCQJBMOrt4/
         4uvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dgajz30m4A09ucwSttYdMUWYSA+eEfPz7ch+rd0GLbU=;
        fh=aWCi2ZUT1z0leppr9YNDX1IGGjvIV/j55olyzshKIx4=;
        b=ABAeyAjsLhRwQT7Ha19Q/sqfT9X4nATKWLSPO4YsW1DtGkfuSmIT+W+Wcwii7zR6rF
         fVeRiVLxD3OV18mN0mG++5tvXzWuFYiDlH0uwKdIHI+ipvO4imz6D6poEN+bVlwhqrOX
         VGDCHDMUOz842XrAs4vmQgP/SQOz591KWiKUaV/lEMUzV1SIhuurk1mxc8rMir1qKU0n
         v5TG3/XwKSQRi4ZZqQ7WdYoRPapYxGjWX4WuUbm6bNgffIsD13Ttfr9B0KSCuj2vd8TX
         wSbfWqGdNzYeBgV5QldrpCJlDo+flm4jqdgRcMMTRWjW6PpI9PylPS3kM0HLaGspE9eB
         eCAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781736596; x=1782341396; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dgajz30m4A09ucwSttYdMUWYSA+eEfPz7ch+rd0GLbU=;
        b=gzFzp/zTOarNcTKDFBhiDjCOwpWmtfQT5aJx3tQ/540d0PCV+34ei6WS/cgXSnit0k
         nZn1XlhHPDEkuQHX9b7bVKmWtLzTJRVOP4ZlC6auz0KGUyfocN/JLxMWuGYLJGkwvKiI
         gkr2PQs2U7RqjcynE9plYJmUXIMeKhM9bJAxBSnWvoXLdYNjxSvOaRK4DEM7uo91of+X
         CYGr8MR/hb5Lam1wokke9QDSxD2EA/HfhGZ8VZB3VfTo0lf5kYPo4Bc1Xl0vAFMd0+1j
         QhKdi1KdV8rWJZ8bQB/UaxHOQnt+eD1i/fq8zhUrjMMVKp7LBGPBox1d/81nnJoszwVC
         uF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781736596; x=1782341396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dgajz30m4A09ucwSttYdMUWYSA+eEfPz7ch+rd0GLbU=;
        b=NaGSmNq817r38J2XB5rhQHC9TZZ09wtct8pfHhdXsJlSrJGcdurgP+Eo41RwOJ6i9Q
         G3htx+9PdZwe7vZkuJZ1YicOqx56Jry0Xzml/QHjBCv6BVXrBlA5eVFSf2fTNyav+hfr
         X8PCCS0kuoPuOzNVWtLVWAb/F7RvBLtcxmD816hdaTJt5wBi+YVsI7zSrpGstFTQzoIY
         6+3Gt+h72/xN87hqEccXH48+YMfGozPj2LAVdsWF0p1QStV5i6aKpdP/X7crTyNRxjjX
         ULv9IzE8Goyvsm/tEk/QSEE5Fcy57bugDt5+Xy4+aGj59Mw0xd1K9dhXqiTaDykk2kBN
         fesA==
X-Forwarded-Encrypted: i=1; AFNElJ9UouuEIMG3kk9DWzousbyVGYaBs0Yjd4HRrcS1fUITf6nTi4L4LyYUdMEMWcuBoc1S7hRxayzd+y5dIl0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPf+F1SZ9JdDclZVgqLd/QGCn6oTzvWX3k7LBDG+aQNwWHnSzO
	gozk6LIInZgoEQP5DnTS8aRD4rLlSjeUK+lK/pSY+jB+ysg2Q4MsBPkTXQhSWn7w/mXQ+3P8n5e
	FOwrq6TsvQZrcOQEYLgcIYIP7k3mrQuV1/Gd0Qnge
X-Gm-Gg: AfdE7cm7xr41Bs5K9BNEiku/tBGNj7BZD1LxmAxfo9GKoDjxMglf3M3zgR3CwwFmdBx
	7dT7rtyTERWf02eFAYTEsJDafrB4BOEvS63kcdJw/azD0uz7j2jRCLC5BVfEdmLjzmpXeYflwfZ
	1rmuE4rWpCCQ6GgcZoqrvskIqkwuqrnPNil9Iira61JAqUynC0XyEOgQUgHgd/CNPDt+T/o4h7X
	HnDHlKdLN7aPQm6ZmzqQZkzkSifUSrxV2xw4HiuiXnshVMc2Xfm5lQXZr3C31e2OhlZea3/DqTM
	Uuu+VtoU2vRA2kqULDQrSIV3KZoL133pTV142A==
X-Received: by 2002:a05:6402:4558:b0:68f:d41d:ca5d with SMTP id
 4fb4d7f45d1cf-695d057dc1dmr7336a12.11.1781736595968; Wed, 17 Jun 2026
 15:49:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617224623.1346309-1-xur@google.com>
In-Reply-To: <20260617224623.1346309-1-xur@google.com>
From: Rong Xu <xur@google.com>
Date: Wed, 17 Jun 2026 15:49:43 -0700
X-Gm-Features: AVVi8Cff13Kb8cdK24_Huf0t2IOMIfHEURXo335nb1vCgemTKsX2Lh00cazJs2o
Message-ID: <CAF1bQ=RjCH8PSimVRE1RdR91TptadYigp=RcUOVc-rJWvu2K6w@mail.gmail.com>
Subject: Re: [PATCH v2] modpost: Ignore Clang LTO suffixes in symbol matching
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Siddharth Nayyar <sidnayyar@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Rong Xu <xur@google.com>, Eric Dumazet <edumazet@google.com>, 
	=?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>, 
	Alexey Gladkov <legion@kernel.org>, Johan Hovold <johan@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:samitolvanen@google.com,m:sidnayyar@google.com,m:petr.pavlu@suse.com,m:jpoimboe@kernel.org,m:xur@google.com,m:edumazet@google.com,m:rene@exactco.de,m:legion@kernel.org,m:johan@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:llvm@lists.linux.dev,m:lkp@intel.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,google.com,suse.com,exactco.de,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13811-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,suse.com:email,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EFA869CBF4

Changelog:  This V2 integrated reviews from  Petr Pavlu
<petr.pavlu@suse.com> and  Nathan Chancellor <nathan@kernel.org> to
use a more direct fix.

Thanks,

Rong

On Wed, Jun 17, 2026 at 3:46=E2=80=AFPM <xur@google.com> wrote:
>
> From: Rong Xu <xur@google.com>
>
> When building the kernel with Clang ThinLTO enabled, the compiler
> can mangle static variable names by appending suffixes such as
> ".llvm.<hash>" to prevent naming collisions across translation units.
>
> This name mangling breaks the section mismatch whitelisting in modpost.
> modpost relies on glob patterns (e.g., "*_ops" or "*_probe") to identify
> safe references between permanent data and initialization code. Because
> the LTO suffix modifies the end of the symbol name, legitimately
> whitelisted structures fail the match, resulting in false positive
> warnings.
>
> For example, a static pernet_operations struct triggers the following:
>
>   WARNING: modpost: vmlinux: section mismatch in reference: \
>   ping_v4_net_ops.llvm.5641696707737373282 (section: .data) -> \
>   ping_v4_proc_init_net (section: .init.text)
>
> Fix this by ignoring "*_ops.llvm.*" in "from" symbol names (the same
> as "*_ops").
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606111233.kM8oo8Df-lkp@i=
ntel.com/
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index d592548cbd60..a7b72a81d248 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -969,7 +969,7 @@ static int secref_whitelist(const char *fromsec, cons=
t char *fromsym,
>         /* symbols in data sections that may refer to any init/exit secti=
ons */
>         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
>             match(tosec, PATTERNS(ALL_INIT_SECTIONS, ALL_EXIT_SECTIONS)) =
&&
> -           match(fromsym, PATTERNS("*_ops", "*_console")))
> +           match(fromsym, PATTERNS("*_ops", "*_ops.llvm.*", "*_console")=
))
>                 return 0;
>
>         /* Check for pattern 3 */
>
> base-commit: e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
> --
> 2.55.0.rc0.738.g0c8ab3ebcc-goog
>

