Return-Path: <linux-kbuild+bounces-13932-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E7m4L2qqSGqVsQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13932-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 08:38:34 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04F706DF2
	for <lists+linux-kbuild@lfdr.de>; Sat, 04 Jul 2026 08:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=fTAW4nNU;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13932-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13932-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8C9873014D9E
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Jul 2026 06:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E270F2EEE83;
	Sat,  4 Jul 2026 06:38:31 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515702E22B5
	for <linux-kbuild@vger.kernel.org>; Sat,  4 Jul 2026 06:38:30 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783147111; cv=pass; b=BybPV/5oSFGSEP0pg5mbijq0nCfJsI07gr2Q3E7iSJnbgGnPbCOu2R/px+JpVAVEykQsLHGnLXZ9K0V0RPwxtJnQBqSZwxtVFY1S89MHVMXk+I7JPuB3etq+/NAJpvBycSJ1hvke9xJecJWI6kYCwU5ZWbMCnChXgc9lvYI4F9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783147111; c=relaxed/simple;
	bh=N/xMossKBfy8oA03YivnWn1kt/ssflin46AGf77iiag=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubHBnNgYWPiKL37ZhlTDTOrx6a1zj9OMF04Sb/sTcNRWHQsnnC16Cae8P71seLCo6NGAtcPV634oZNj1MCXzJ5x3ef988fXv/7/3svSYVU1y242Fa8+v7eBAgywHValG0hc455riuTG6FLPsgRnjNu6FkW5OYvngQi2gI7QiIow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fTAW4nNU; arc=pass smtp.client-ip=209.85.221.41
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47640541585so781125f8f.1
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jul 2026 23:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783147109; cv=none;
        d=google.com; s=arc-20260327;
        b=k8XfpP3/TEI9vRYyurgOBKH4JVlkAh36zwRmi2eIso1a2LWAcPv7Z5KzAUkLc8wep2
         3SpHUsve49MpKEn3uQ5+OR2wHCdNBp2kCcv77iEj+iRNyo3XOLiQ1IIL4j43VHHME/TZ
         8D0B4eJe/wKdLRx9FW2JVN2SjK2K1xPV8wktE3OgiFzHjWtdLOyolaR132IJVH6vwCEC
         UE6y8aUupGwPc8cglfEWkLcRX7HhMJe2Nc0tAjI55YXWCLUSCqRNdPMSjx1NubmnVWkT
         4DNWnYNVNzGo5MjB50CoKILzB8M83HbFJNCeLq/25yv9BF8TjpJSNSCoK2Ek/Z8qD/JL
         OTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q9yBmP+UxaM9ADpHLf6/q1RsmhTOoAiQijZwi47uHRA=;
        fh=IPmvJXSRA5FWvc3r4qflGQlDiYcJHpMadDI/lIWpBpU=;
        b=EAiJZIIanTUjw98KDKN1OGcg/BAg3RAcaAGgJWX+Oo2/6/6VuVC58lN5d3eadvJKKs
         qMOrNfHe1aHywLd3qnvDnSmrxIQfLCzmvgA1jyKphuz7RXRPUMiES+Gzu3FIG0qhIEBf
         XaZFNwLYnpi4Ry4rKVD8V1MZOYfwdXqr6QVH5V2AktugSiWD/bkW4AKvz1QV4ochjMu5
         1Zs9U90kbaHSywJ87lqkxM/kHAuYPDPhPy6acGffhMKEb68BkNDLNOrMpTf3hl8eIVNt
         IgnXRjNhVvMtSKpNrchYzJmkArNERJIHTPb8d+DMsSmvvidGHb9gEHlFkDUA4AtIzVRM
         u/ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783147109; x=1783751909; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9yBmP+UxaM9ADpHLf6/q1RsmhTOoAiQijZwi47uHRA=;
        b=fTAW4nNUfuppvYe0ea0hZmNFuoXvhMYgICwnvBQZ/FgJoaVPTDeUXDGWMY02QvTaS0
         4MP6i8w8cqSVSna7eOeaMeAZHVvZQ+EmP1qGkGEXOvOA5x9KYuZt5HRid/ojDVpZzqh6
         opVG/P3UksBUIsrYF2AnTWJdP/ccXRTwGk0AQf3zUnt5dRrTY02KSb2E4Cbhiqe9UWG2
         WOk928ydF5HdfcCcCbjPacAW1N+mDElcbPOPodV48OTp0VqF8prRgePy9JH8YpiOHQRW
         W6iCtddw2qh37hpR/Dh5ADP8z4+lAFJnV+aivg/HqFtKOFXH0UyWwnV+1WmcwUnhhizo
         aGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783147109; x=1783751909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q9yBmP+UxaM9ADpHLf6/q1RsmhTOoAiQijZwi47uHRA=;
        b=s5DVGJX1rpobqbUv80gpOpMKEIDv2n2BX3zvuKN5VuPJ40BpIJP4IHJfzSps+aChZ1
         wY0c4jRj4mgsOXJ53FpGcOJQKotJBReqNrWTJLxcssoT5D7vHERjpCXGXIJAx60D6z9N
         mITV7gq/3pqFtez5F7V3rxvSnY7lOAVHHJiE5BRjBABKjRJS8NTWa0KdyDUJQiIkt27p
         JYDadJfgNpKD8sk0mwgKq0J8O+0Ea0m37+YZLf8gYm9yP5vIvvgClIMfTnLBLNa/4vRo
         CRHzJBeRfu5z6i98uxwWFiO1DmktOgN/3i4qJWeYkWr71ZOO3iSpfgVuNuXSS71uUe3g
         8Ntg==
X-Forwarded-Encrypted: i=1; AHgh+RrRCR/0sUCA998SGvlyejKPvWvCqKBhDqdasYjqaOG4UgAWvVnFRVvNDtMhma71r8hiT3ViJ4BvfRnZi9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aXEsKlZ2Vtp8DCjUkXPLDOXa0HryrKqhw8+Ye6tUM7L2GsIC
	tjg363kWV9UwVPEz4eGQFuPKEOlcHhBSd0mG9HD4l2cmPzetj72jh2NqF/okVzD3e2CQ1y4rpjG
	9bDJEjyGO5sgqRlh6Gw7lqEpMyWi4CxaoM/Zi
X-Gm-Gg: AfdE7cmAJK5Af5Z8Q5qGGCCt42WleAeVTDGHsI7prYJyC1OeX33HJbhGe2Gq23oIpHb
	OBNtnOJVSBheqPOJTDYAOWcDXVex9b09e9SJm7ATDjQ2Gb+Ddo5JpTDIZ3qsFA+0tBN71gHOgU5
	SagCo7f3aGlArk7QrPNdFFYW+k32YTEn+xMLn3YxaKm9/Ka44DvdQbTWAR73e8qumbj/4Vi/GaK
	TBIlZ/HLPrO6JGq88txq0P0wFlm6AruKx4vCKw62ZGZUlPPw/IOoQOkdLcE+CLHqqZwmbFyDMAs
	PRHkvEs4I4vX+p1PHALeTFjXJRVGneSEIlxD21iF
X-Received: by 2002:a05:6000:2483:b0:475:e7f7:ef7a with SMTP id
 ffacd0b85a97d-47aaa046e04mr2434857f8f.23.1783147108482; Fri, 03 Jul 2026
 23:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net>
In-Reply-To: <20260630-uapi-assembly-v2-1-8e7bee2fe816@weissschuh.net>
From: Nick Huang <sef1548@gmail.com>
Date: Sat, 4 Jul 2026 14:38:16 +0800
X-Gm-Features: AVVi8CcJ9VbOhb_7eOsh7xtWV9tVcJcOMgE6wgwJX2yJwToXlSpPmD2nttn4GjY
Message-ID: <CABZAGREno0TvOG==jkjuxKcF0Q2N_S3J+QUCPwchNh2-YgHXuA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: headers_install.sh: Normalize __ASSEMBLER__
 to __ASSEMBLY__
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-13932-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sef1548@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux@weissschuh.net,m:arnd@arndb.de,m:nathan@kernel.org,m:nsc@kernel.org,m:macro@orcam.me.uk,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sef1548@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp,weissschuh.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0E04F706DF2

Acked-by: Nick Huang sef1548@gmail.com

Thomas Wei=C3=9Fschuh <linux@weissschuh.net> =E6=96=BC 2026=E5=B9=B47=E6=9C=
=881=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=885:15=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> There is an ongoing effort to replace the usage of __ASSEMBLY__ with
> __ASSEMBLER__ throughout the kernel tree, see for example
> commit 287d163322b7 ("arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in
> non-uapi headers"). The latter is automatically provided by all compilers
> and preprocessors supported by the kernel, so the explicit definitions
> of __ASSEMBLY__ can be removed.
>
> However the UAPI headers might be used with non-GCC-compatible
> compilers, which do not define __ASSEMBLER__ automatically.
> So this migration may break users. Also during the migration phase, the
> UAPI headers will use a mix of *both* __ASSEMBLY__ and __ASSEMBLER__ at
> the same time, which is ugly and inconsistent.
>
> For now make sure that the exported UAPI headers consistently use
> __ASSEMBLY__ as before.
>
> Link: https://lore.kernel.org/lkml/164baf81-2824-4943-bbc1-4ae8a160c0cc@t=
-8ch.de/
> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> ---
> Changes in v2:
> - Normalize *to* __ASSEMBLY__.
> - Link to v1: https://patch.msgid.link/20260309-uapi-assembly-v1-1-a7ebfb=
f14309@weissschuh.net
> ---
> This should go either through kbuild or asm-generic, I think.
> ---
>  scripts/headers_install.sh | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/headers_install.sh b/scripts/headers_install.sh
> index 9c15e748761c..83e447596878 100755
> --- a/scripts/headers_install.sh
> +++ b/scripts/headers_install.sh
> @@ -36,6 +36,7 @@ sed -E -e '
>         s/(^|[^a-zA-Z0-9])__packed([^a-zA-Z0-9_]|$)/\1__attribute__((pack=
ed))\2/g
>         s/(^|[[:space:](])(inline|asm|volatile)([[:space:](]|$)/\1__\2__\=
3/g
>         s@#(ifndef|define|endif[[:space:]]*/[*])[[:space:]]*_UAPI@#\1 @
> +       s/__ASSEMBLER__/__ASSEMBLY__/g
>  ' $INFILE > $TMPFILE || exit 1
>
>  scripts/unifdef -U__KERNEL__ -D__EXPORTED_HEADERS__ $TMPFILE > $OUTFILE
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260302-uapi-assembly-0bb7213b41f1
>
> Best regards,
> --
> Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>

