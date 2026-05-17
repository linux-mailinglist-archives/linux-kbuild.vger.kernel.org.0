Return-Path: <linux-kbuild+bounces-13204-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PJsICa2CWqomAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-13204-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 14:35:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15435560FC3
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 14:35:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 481C53008779
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 May 2026 12:35:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F0935F5E5;
	Sun, 17 May 2026 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjKGcA1d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC7430EF88
	for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779021343; cv=pass; b=DY/Gr8a+GLr/JUOzz9pRJIdzTT0gGbkWEF5jDYp9Er0Si6x/LsJj0GjOUry1MJaD23SkEQpMdp7OjXkLdZvn5nl19tkUmcPxtL3+t6jFZVX/4IRGfvrEAd2GiyLIfDj18cDp8yPOpjRifuB/G/X+R2Lannpg2uqQ17HDiYvaBkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779021343; c=relaxed/simple;
	bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZg48y1pK4sGRNdJQqb1NFHoWZjP/auZFRJLkqpDcBvmFoY6QtrLaMvuXE/n9p+GzBh33/r7Sgc0b6mHDC10Y+c1QaUp5HdGQbTUngw6+pRxgZRiRSDaTyCIgozgRU2Rl9hpvQdgmGGjt/0C87biIwvgDsUdKGiei4P7RXzFve8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjKGcA1d; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2bda3b4318dso68988eec.1
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2026 05:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779021341; cv=none;
        d=google.com; s=arc-20240605;
        b=bM0cIOZi5TpM2lgFZnaZHuugKBQVHAl3swB4nIl+sUJs/Wa6hEvkbRXkGjRvq7fHcd
         o53DtDYWHN6VzSJ8Vdoz6FcebNJ31Gd1FC7pC9Svs2hMZ4hsaTeO+K7BNtXU4jyIBJ/l
         ZkVQYZ6x7zu2dVBh8khQWxezTBXg5Hb2SRbLumUZOLpuxLkfVcCP/yww8JnVpLE/p/NH
         RDXJo+Sq8T6rFY0FnjCkG3il3TuqoKi+qIXbHDI0svrlSptCw/TIWPfGUmQdsp8pxvG5
         4pBA+flBzP7Q4DadDs3aoR1ZCBrucwwpOvVs560w2WsX7syi2jW85RDz4wL36YihTwQS
         puew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        fh=6cEVZbvCsFEsXKGfnpXyrJjWe/nuzuolqZMCen0a2tw=;
        b=Ye/36dnt4ndiPx4YzPU/xw89pUrr6j/eoQl2WBXrS0n/95bl8usT7HJEmncPg0rom/
         hpTAJ3T6Pa3mT0wBS3NZTTSVtEdizN+w3140OyysPYKr+pQ1fomcFBQoC/MgBEcJx46W
         0WyeueAKy+QI1zb1PBQGDleZTaBwDe3t23brwRyG09sC+TkM6mbS6Ij1/cjl2mfgCO9E
         2igeMYpbyz0F4JHqO+R4MD6f3DRLlgTnOcaMuZ4fViMjTGL+DS/qw7Jmte1Bbd/iveCy
         kNoFR2RJsYjtXg/YpKuKLcKKhaLQx40iDz2YoLx0jLKFhCzM9QsIDbyLpTPaZ22R0MG4
         ocTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779021341; x=1779626141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        b=ZjKGcA1dSL5wVUTKvrIzCjFDf2h01d2J7ChDnaeITFYcJLDQWYhmRoPXDxVS4eR68N
         f4CI+3SI5f0LpgkG2iZFGfM6dz2MxyktVDFrl1HxTLnDBl08IF+uGDe6S7o6Iugy8Tbh
         +WhaWOrnyP9BooFnYjLOERAgA9ttFatntyMRqi/fXiK+38pc1zNokRivepbOlXFmlV7x
         bJ/d5vFnJLN9WYEiNWEoaRM1Ll9YeC1I4/e61YFOVW9FxzLI4KD0xAfaap4ZFxzvgOCL
         Pe5iLiocZSuJ7q1qYLGZLWBiHZVAC8XL+7Q+eNaCMy3A7ZKkG18Od4uwxjH/+AqjlDAu
         4sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779021341; x=1779626141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        b=K51Q1sVshPqSRyZ9oLmtg1Xt5TN8D98e98xQvsh9Be6EfWO+Jd6x1lgXOtNHyn9mDB
         J39EWqDcvET6tIjI01atKKqaI9N+OP7AA3i06B3xYtQOSM1t3k92ghx0TrshDPd0ftYL
         BHqEY5ry7CIgUxqsmgR4Cyc5HYFI1JxL9PqqA5QkjHCIePHo3LadhJWkT00Jsr7hTQ9c
         9qqcfST7mMDMwx/mazc5+lSbTLpBLf47TvsmYmLMzex5Lcno4sxP1G6U2USmIvzfj2sT
         vQHahu7DWEtUHhnlvJB+/rxh9dcFgVX5oOX5nNCtVedtOwq+NZJTex7w+HPWj3eBmgWF
         VzXg==
X-Forwarded-Encrypted: i=1; AFNElJ+uw2oKIlPri2P6vkJUKvn1+yKI0tJEabDqdGfhB9VZJfmYDl6ffff5WwdfIa3Arbes3PblzekSiTIMxXw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtznn1xH+k4fyL0GgrRuGXMo3rU3/oa9VKA2idAKG+jAhFhUkt
	7eWzbLkj3w9pQtxwqXOJ/tDyr6iIGxA0MhoABCRXfs1rthFD690QREysu5XFhSIRP0rl7UuZ4IJ
	QoExUveKn12O7sfQzY52+nXXpFg2JCxhvdsa+320=
X-Gm-Gg: Acq92OEmnaDFN9bSavZ2Kq5Tx/SywjROlp92YWHLWkOY4+rXj2sWPQPEeZ4WrgGh7Yo
	jm9/gaSXCXfp0z3K3ZjlTTTsbH9ZdZ2MxVX59JJP0mTFg0uFo0gRlI/Xe0CelGNsYqEqdsKPNj0
	8RQLjEkdksyxD5zrfbXlzomJAn1kcuvJWUI5XQykN9Gsjw66YxPfW3veIJFRoWX+BmgjsvKn+AM
	GiONBGyVEyQim80cvqdMwGixAdJdIColXhctEp7zl7ORdcdRdk6Q+wW0qCwlLQcFzBl1yKjKDGh
	rMvQcAXRdxQ1yEmLXfLm1h5z9lVhy7l8xEsrQXgxpIpKlwhEiHLTj8UFxmEMyfQV7yEUYzA7GqZ
	r6iNplGEKl7c3rGSC0zdMRM4=
X-Received: by 2002:a05:7300:e6c4:b0:2d9:2896:2794 with SMTP id
 5a478bee46e88-30398737cbemr2263699eec.7.1779021341133; Sun, 17 May 2026
 05:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-3-julianbraha@gmail.com> <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
 <20260517094041.GC3773662@ax162>
In-Reply-To: <20260517094041.GC3773662@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 14:35:27 +0200
X-Gm-Features: AVHnY4IZSFNRtOREQTvbcPWlzfBHcED3UQFBqTP6EdleEX439u6RoJ3RvvnKjFg
Message-ID: <CANiq72n3Lz4QeNnEOWfEwXHc1+UdnsbsD-9wvR2OnhLsYBsnqw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] Documentation: add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 15435560FC3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13204-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,linux-foundation.org,garyguo.net,arndb.de,linuxfoundation.org,lwn.net,linux.dev,telecomnancy.net,inai.de,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Sun, May 17, 2026 at 11:40=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I guess this is kind of a weird/unique situation. I agree that the files
> generated by 'cargo run' should absolutely be contained within the build
> folder; at that point, $(srctree) could be read only and I would
> consider it rude not to respect the user's choice of build directory.
> For 'cargo vendor' however, I am not sure. They are source files and I
> would expect that running 'cargo vendor' would be more considered part
> of preparing the source tree, rather than the build one (so it should
> not be read only).

That would simplify things, yeah. We could always start there and see
if someone needs it.

> At the same time, it might be safer for dependency updates and internal
> consistency that they are confined to the build folder. I guess we would
> only want to remove them with a 'distclean', rather than 'mrproper' or
> 'clean', in that case, to avoid requiring users to constantly run
> 'cargo vendor'. It might be more ergonomic for this to be a Kbuild
> target ('kconfirmvendor'?) so that this could be handled automatically
> based on the user's build command.

Yeah, it is a bit painful to not have the usual Kbuild
variables/infrastructure around... On the other hand, it is a nice
property to know that nothing called via `make` will ever connect (or
need to connect) to the Internet.

Hmm... Perhaps a good middle ground would be having something in the
name that makes it obvious it will connect, e.g. `fetch` like Git? Or,
if people feel strongly about the property mentioned, then something
like an environment variable that needs to be set to allow it (with a
message printed about it if it is not set).

If this were allowed, i.e. if we are OK having things in `make` that
fetch stuff and put it in the build folder (only in certain targets,
of course), then we could actually think about doing more things that
we didn't so far, such as other setup-like targets, e.g. preparing
kernel.org toolchains, setting up a Rust toolchain via `rustup`
(including `bindgen` etc.), and so on and so forth.

> Additionally, can we detect explicitly when dependencies are not
> properly vendored and error with a more helpful error message? The build
> command in patch 1 just throws up its hands when the build fails and
> asks if the dependencies have been set up but if we provided our own
> vendoring build target, we could add some canary that says we vendored
> successfully and if that is not present, error before even running the
> build and say "hey, you need to explicitly run this target before you
> build".

+1, good error messages help a lot. Something like `rustavailable`
that prints which particular thing is missing is great (that one even
tries to warn about some problematic versions testing for bugs --
hopefully we don't need `autoconf`... :).

Cheers,
Miguel

