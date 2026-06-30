Return-Path: <linux-kbuild+bounces-13912-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CdiaCMf/Q2pznAoAu9opvQ
	(envelope-from <linux-kbuild+bounces-13912-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 19:41:27 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FD06E6FB0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 19:41:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=V7vNxwoA;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13912-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13912-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A0C7630444EA
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2026 17:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D223DCD8B;
	Tue, 30 Jun 2026 17:41:12 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7239F315D53
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2026 17:41:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841272; cv=none; b=jd5+HAZEZ0J2n+VuLJQ4g3iO6SKdMfnqcYfw0CdW/nyqzFHgZDABGhEhWdLSKP4JkGiS15IKNLf4Bkb7gq/RFLBRTT67akCxHwpm+m8wXoeQPIRtDj5yIXm8EScWLVSDo1dZDRrIoM91tp0PKyl2AIwYcvhusLUiglPsjEpxs8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841272; c=relaxed/simple;
	bh=G3PRqTzCs7RJgq2SvLzeR5x/KVyQM2abNcWze+dLFJc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LePRh+QPeZRkX3au/s3HR91g6rPGyenWhS2mhSIH3YrDskqc3LEHnSQxZFSxuQda0d6rrfGFQE+cpZUPsGKE4N+RxyhHR9bHah6/YiB+XYuXsHSFJaUxsuZFPjgRu80hrOjDgKGMVOG80mwGGc/SMPv9G0JJ4nPNW2cVAV8BrQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V7vNxwoA; arc=none smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47488efcf30so1299869f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Jun 2026 10:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782841270; x=1783446070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwzV7dy3jE3WT3snLY2kOe0bzSNv3ebYJGfOv308YTU=;
        b=V7vNxwoAlKYBfIQaoVwxZt9i7JW/zEkP0BbFk1h/q0Be5PJRD0qBHR/iZ8BqsW/eZi
         tXt1o0ei4cFpKGO6BryM/6IqNMZARzk0sMm3St+Q/j4bT4SpRJCUXHKPStTsiPzdJEM0
         f4kxIWQmM4POVcVmcKb6Uoo5Qutci2WxMkvmInCGrprLo3Kdd2MKSpiI7QihgQW4s/ZY
         5EFG1MRs/PlY8ftaYZFRfVykgh98de6RazOlEC4P3gvxEKSjfAsopEGZ5DRhBUlHq8/e
         ee7TdL/NuxZBnJcvm3gJDqc9/AiTTqeiLwHsae6j/ijoPPpG9q66cnvcNxw8waYJ2d26
         CVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782841270; x=1783446070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vwzV7dy3jE3WT3snLY2kOe0bzSNv3ebYJGfOv308YTU=;
        b=OBbfLVW3j+hISQYqqUXcj/qq6fq56xLAgeorBiSVqfh/u43+mrwfhyanZTQ4RI9TAN
         ZgX5ay5GUL9T/r+fn/VfDG7LrsitXIKj3XfvCqXGx+RJgXB2E411gjh+km/vH00b9xa1
         1LbEK22Q+NKeKBQ2fQaVfPFz2PQgVL10v3QpE+gqzCWfpHzlxMctiLz4HPOeElQxCGGX
         hpRgM4K5OzDPQXlFTpfipAOOQI5+99JdwTNyNcQfntIyw8WRSGlIHmnLVI0THUp49vlv
         vC0ldPfGOyMDkzkNb+WY5hw+0jYNp34iBOhhXK0B5QY5wE3xZRXm5qAZStGqOsOgTGD/
         E4/g==
X-Gm-Message-State: AOJu0YylX7xkuQnSVzFtYw/aKeuDule93t9UEWyZnnve/AjURFRJCpSj
	gFDvDz95It/XBjfHDiPaMFgJq0/lghhAkCczv50yItJcTSq2b7fket5n
X-Gm-Gg: AfdE7cmuYAeccMtlzysEtzIDU9MGiBGxGqba+qD1EMyOOOda1NO4MDJX+2tBZ6qBQ7r
	Bo3yJo7FQf2qkq/Hu/X6s7L7GMgi9quErknB/C5kv/ej5FAuXTMNpEaK5L9ZTKGDfYoUxy6RlHN
	+1XAb/FXm/1jIhhQShMM5/M2u369tl+WXVtreUXQ085A07Z8xs1XYovKNC2cv5jCvSqb+KXrHw5
	x4KwO4khBKonn8b6q6KsM8/gUrCmfjwGYfn5An1Ddi4BkHoIz9xvOMKDoqr2Jw2XtO8k0Sdxcgl
	ZX3zGoLw+xr5GhuMPvpyQM7CHbHYQueOYM7PVnDh8e9A8vBzoIYm6hgtQMPIiSR/FrPRC4EGr9U
	Ys0adA6gwsT+OFgrbSr/n2WMSZY21YOAMW57rIX9Eo1/87mLJvqKd+Vgb0U4Crf5Eyt+0p3iBZ0
	QhM/psUgDhlt8XrQzy+L3+9HIWFJgVJYaAvBr76UtCsdmjWQ==
X-Received: by 2002:a05:6000:61e:b0:475:f0f0:9eef with SMTP id ffacd0b85a97d-475f0f0a14fmr4464526f8f.52.1782841269637;
        Tue, 30 Jun 2026 10:41:09 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm9229282f8f.7.2026.06.30.10.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:41:08 -0700 (PDT)
Date: Tue, 30 Jun 2026 18:41:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Joy H.J. Lee" <rkr0k0r@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 masahiroy@kernel.org, nathan@kernel.org
Subject: Re: [PATCH] tools/compiler: match glibc 2.42 definition of
 __attribute_const__
Message-ID: <20260630184106.7bb3f22f@pumpkin>
In-Reply-To: <20260630145840.2717960-1-rkr0k0r@gmail.com>
References: <20260630145840.2717960-1-rkr0k0r@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rkr0k0r@gmail.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:masahiroy@kernel.org,m:nathan@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13912-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0FD06E6FB0

On Tue, 30 Jun 2026 23:58:40 +0900
"Joy H.J. Lee" <rkr0k0r@gmail.com> wrote:

> glibc 2.42 added __attribute_const__ to sys/cdefs.h:
>=20
>     # define __attribute_const__ __attribute__ ((__const__))
>=20
> GCC 15 warns when a macro is redefined to a different replacement list
> (-Wbuiltin-macro-redefined). Since host tool Makefiles (resolve_btfids,
> objtool) pass -Werror, this conflict becomes fatal when building with
> glibc 2.42 and GCC 15.
>=20
> Per C11 =C2=A76.10.3, identical replacement lists are accepted silently.
> Match the glibc definition exactly, including the space before "((", so
> the redefinition is accepted without warning.
>=20
> Signed-off-by: Joy H.J. Lee <rkr0k0r@gmail.com>
> ---
>  tools/include/linux/compiler.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compile=
r.h
> index f40bd2b04..f2f54b038 100644
> --- a/tools/include/linux/compiler.h
> +++ b/tools/include/linux/compiler.h
> @@ -119,7 +119,7 @@
>  #define __read_mostly
> =20
>  #ifndef __attribute_const__
> -# define __attribute_const__
> +# define __attribute_const__ __attribute__ ((__const__))

That doesn't look right, you are completely changing the value
when it isn't already defined.

	David

>  #endif
> =20
>  #ifndef __maybe_unused


