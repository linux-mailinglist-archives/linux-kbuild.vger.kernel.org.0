Return-Path: <linux-kbuild+bounces-10732-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMGbC8uDcGktYAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10732-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 08:44:11 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D19E952F89
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 08:44:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C4CD4707116
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jan 2026 14:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF51243DA48;
	Tue, 20 Jan 2026 13:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KH9MBB4n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5B43DA5F
	for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 13:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768917480; cv=pass; b=q5ncGhusYOcPZQoQ3l+7JQjvf9pR16ugPO3yYsXirj/jG8r+POVWGEFAj0nSpFKUKR6s5s0sFfNXGmGUd6xNrSabIs1b2cuwhLJ8nl/EXpZAI702AVEKgS9VIPMWBjmehsNMQMMsp4LXehSKeCZ1pW/g3TTfRCfzxxmXP9cwYTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768917480; c=relaxed/simple;
	bh=OAGjZkrbiq/bQA3jfN6VzfXNX7TX26hRESBiS4kECbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MwACmI/wM9ZTENDhgslZRbAtZrkrJ4xeQM7GSU/EPeLpgoMNuJ4KzXwadQu0si3+CMSn205czcpI4j1shhNE2TevHJxqttgvBUSBoxs5JN5ukR1e9m9mOHa8dwCzzwhxjxAIaJgQq50vWnR9aZ/fxB6VobUqp+w4ujjk9XCM1q8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KH9MBB4n; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1232c98f98cso375083c88.3
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Jan 2026 05:57:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768917478; cv=none;
        d=google.com; s=arc-20240605;
        b=Jv0vt3gPa+/8zgbarq4d5pyykmlNrSlinfkddKk2jp9SON9KZ7NBnXsdYN2BTBpHT1
         XEVEbMqPpY0ujAH0+EFiA4lEkt+TPEgU8eqRUcEHUsDbKiheTfC7gXpVH8fc7F7iOpyY
         d+G7NR7ZKqR73c9EJhCO18O8ootnT29rJhpI78s2U29al2MBq2Ou4XM4noI63s949QPA
         M6T8yObjxyfLrqUugcRFAn9Iwe2DZshyAs5fuPkCJfZL38IB7JJlh9sreHFYh/OVpJNJ
         buwXTyhSB4pIWjLDQLmYmNox1NhLLF6QduroGJslUDrMAPMH+Ox5lkV/e/ZmUP5HTXfH
         drmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N8CIMHpL2KT9Zw5mKFt7tiXNzVm1VMS6xo9LvlLfyuc=;
        fh=AuCTB+FtcWlkj9c+OJ4vRQeEOsS1RFuNd1uMYDGfukE=;
        b=TvRn1C4TPeCoJSrEtqwcPIMWgrrxrEZmiCgKKupmR10p4rLfcjIwRDyUormicb/eR4
         KV2xyePs8TarHPiULLmjV5f8p9kJexYB0JNc2ZerUdLV5+YFfJ01kXhTnH0OxVh/1RqF
         ha1ZkCuYY14Pfb5rejVgCh7ekwBg6153PtbD7sWIWVWfkUDgOwTgspnfozeoN9jFfasE
         4WUSRtkGtLXWP7PmcOE9KSmSq0vj46NwtZ3c4xO0vXhqDKg04dHQWrXy59IjaG8OXoXt
         L+inB8VnmQkV1iPmcrXyH7QNzMBiAtDu+P5tnu/c10hmm2wkqlnP6JOq00suR32DnZsR
         Gkhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768917478; x=1769522278; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8CIMHpL2KT9Zw5mKFt7tiXNzVm1VMS6xo9LvlLfyuc=;
        b=KH9MBB4n4cMxPxJUu5hD27LizFmeZ55LccI6MAPNUNE/nI2vI1Ho/jGh/L6V1SjN2P
         qPCpvzkGHGbQORKeGbx8MRF+IGV8m5vXBvjEXpyD5ttOve4IHbJML2ZLu8xeDLjq3Wmy
         0/0DIz1gxpRRwKd68PuBeNPXvffU1QftsYiAyDhrNP9RKwG5MJvB9/zpuu0WSFsy38IH
         eHjA766teRGYqXdVYO3x9uwoqwkgB+juaiN60Rq5/bTuh8TLTpHVHdqhn0S3sGRXvG0x
         K/fPHLltjab5ymYSqiKFNsMSPZaaaWIwXapndCjWLNXNakesaCsNdmumeN18YwZNM2sG
         /V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768917478; x=1769522278;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N8CIMHpL2KT9Zw5mKFt7tiXNzVm1VMS6xo9LvlLfyuc=;
        b=DUgtA1WmwBz3liDjZ55lZhXYNAGySQkj4/94QzwxNo9FMOjauiLASnLbxCBG6XSjfL
         UJLuB1Zp26kZvtCtSbP+cKUu/QIE7gRpslBX1DE34yd3yAaccTNetM+8FpGihDBukUQV
         nvdITJvys/bfF+abZXzlJLB5hT8eMr+hAZdqhylvlRW9zpAz9BSbLcCYWInRPpBInyCA
         pA6eDVM4/iGDtuxUM4tm9X5oCXLNjJgTTn2ewjfDzzYAO7nYrUHfGAVKnlGB8hBnjBgv
         R9bsl8xoPp2hIFTbnDBZ08Fj1x/VF/SOjEdkbFtyuF48jxJr8Ux5ymFlu5ueCklkbU/C
         T9yA==
X-Forwarded-Encrypted: i=1; AJvYcCVE8Gvg93/F7PN+suo48o4ML4QZI+xgLT+ZybZ3CBDbej3fmQmuX14KHXf9QubqKZKYWlBKXAW0xgCzEN4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOrrvsGvaGluh9rQjOt8McQmuM16clL4llCHMdvmAmOxQl42lh
	ph/M6gZDAh6aBg/8OwLONESMBiifSinai9NKC6CPNwsTwfoQF5q/gVDajj0WeJ/bSNVBGc7w7u6
	i+CamX6hCM/ergPG1vaigTUBM9s/fVjg=
X-Gm-Gg: AY/fxX4ZAzdNnMPLSdB9lwmVuXUBcp5f0deuW+XCsfxV3H+74pSi1c/h0Ecllmu/DWz
	jsxFVT5sBgxCksqLupF8iP9sSAjklov36HTh9QfaxQIqDjdt7JE3nj95FRtm9i9UA0Lkuza/5Ts
	WImi/L/T0BXuFZaPEdGAFpPNZyhZJl49FV/0LM1eUK9z/P68yz/9U1XWzsiY3z9WTghWWYVXX/a
	wfe+3x1NxlAFywbX2+676xJ+6O7EAG56dDNYV8IxOZm5CFZjCzRqJl4A6N2He9/npdKhoMSWmvt
	9c+u4hoBUxHWBaO2vaEj+hC0z14rYUvxj5h2rQUGdNhrRXvFCK9FmHC40vF3YQKS9CNDAqoKIvF
	3osdeRrF0pSAK
X-Received: by 2002:a05:693c:414b:10b0:2b4:83a7:29a3 with SMTP id
 5a478bee46e88-2b6f6afc019mr939495eec.0.1768917477834; Tue, 20 Jan 2026
 05:57:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-ra-fix-v1-0-829e4e92818c@nvidia.com> <20260120-ra-fix-v1-2-829e4e92818c@nvidia.com>
In-Reply-To: <20260120-ra-fix-v1-2-829e4e92818c@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 14:57:45 +0100
X-Gm-Features: AZwV_Qj-_UYcKgmVwZHnUgee6jlz2eLrchWIp8p8szSOUtBbAiNy0F0WbiN7czI
Message-ID: <CANiq72kRdBOfa85PnOTEYY-9bcEewerom_LOxucKFs_pBmcsrQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] scripts: generate_rust_analyzer: plumb editions via
 command line
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-10732-lists,linux-kbuild=lfdr.de];
	URIBL_MULTI_FAIL(0.00)[ams.mirrors.kernel.org:server fail,nvidia.com:server fail,mail.gmail.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: D19E952F89
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 9:54=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add --editions argument to pass crate editions in a similar way to the
> existing --cfgs mechanism.
>
> It sets editions as follows:
>   - core: 2024 for rustc >=3D 1.87 otherwise 2021
>   - quote: 2018
>   - all others: 2021

Could you please explain in the commit message the reasons behind the
change? i.e. commit messages should explain the "why" (advantages
etc.), not just the "what".

Thanks!

Cheers,
Miguel

