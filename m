Return-Path: <linux-kbuild+bounces-10791-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BodMUDBcWmQLwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10791-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 07:18:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B426235C
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 07:18:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB8944E51E6
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 06:18:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1589423A91;
	Thu, 22 Jan 2026 06:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkCUBk0I"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7963F47A0B1
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Jan 2026 06:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769062714; cv=pass; b=fbHdWqTHlsZD+uqk94FqsgWMgSsax/Qf5QuFj0RJMYgULFsuHWzmx1gYNW0gkmFn/F1ueD4H6MR9wZ5FBx3qKBj7dFcrQGu/rjUfYda7s46pZKc13epfq8gMZFoBE9BiasX96WaDpWbMaKsY35NnFswlwPhNhk5HO7ZrSku4bBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769062714; c=relaxed/simple;
	bh=S1L1cVkfwEFfqMWQmg3yqS9J1VAzVceKN5SIB14umkA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WTChGt4pqBZ3FyUhBLdnU5Z35Mp5BnH4NJsXrBcd8PxAFPLdi+wa5r+i4C10as3BjSI91aJr+FRgMA5n3OOqCz4wxlKD7IMAUzXFyz3hcczwXNy1anmrUjmMUBH+413MKoUa4I7q/9v+64jvk7/OzpryMPWRH3lEKPXhNRjXwR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkCUBk0I; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1232de2e2c6so59964c88.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jan 2026 22:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769062711; cv=none;
        d=google.com; s=arc-20240605;
        b=RLdwiiThU0mTkgnVD8YSTZ+tpu2q5TWslGVUCn03cizhnukJO/u+NAK6AjT9g03sYM
         xeAjRkFfjq5xY9HMvdXQX/+btighvU8KoJ3gmpTwrmfF0z+rd++BAU5yTy0no8niXI46
         4YtSQD9JWrJKELeP0p/gI0GzXXRowNbm6f4mEqKBF2TIZV/l/+mqV1+IfCeCWK3+9Bie
         G7DBfgkeK2Dg6G3nWvuoPgCvL+if1mq+v7vok8s4ZoTBoCV1EU0lx/KexX1lxLJwmtau
         e5nJxnN8/KLC+W3CgErFJtOe2wFKm987mQEHvctlM5iSFi9USwlCfmUAS+H3/gryB7ei
         B9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S1L1cVkfwEFfqMWQmg3yqS9J1VAzVceKN5SIB14umkA=;
        fh=tau3GuGTjK7950eeNzzFGnsRnuKpg05+WlN4vl+DlgQ=;
        b=Au6kis434jUmookW+Y5/6/XQ9DIISsXITZwVc6Oy9R6JCyJNa9TF8Qqi4t89OeUwlK
         e0i1jN6AQI+Ynil3mdYyovyEIkbiuTOvbUdOKnu0uLT8bZr/w+6RrxBkTs2CjGTZCxcP
         cLmLLqUgyUhlY8dHho3LKr0OOb2X22sjJ9IdbJaoizBak4UZ/rsFHLXKZRRf4E1GeHcA
         51oD9BhsRnmuJRqpt27/ZPYQfrCe+/NU+Fi0cBKKJjgV5P0hSVecSoyfDcprTKCU6Eu6
         E8eZ1OOG2e16H+WGMhMsXBvGvPUAbvBN/GjOVT4hdWFYOxh3fiRO2IHgz654KKDzdLiM
         CjUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769062711; x=1769667511; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1L1cVkfwEFfqMWQmg3yqS9J1VAzVceKN5SIB14umkA=;
        b=JkCUBk0Iz+Y3i4lLdhdfkbvEF5C5tsbT9DWVH4/budjnAZK7JXzj8gma9B3IfSBMzS
         EAXc0egsR6eVlEqRBLf+RZG3iJZWU3a91pTAbBjz3ectZYigIKTl6pLgXo1SXTVoFHhx
         a0ds/K0bOvYpDEX8wZ1fDGMW4oD5DvF83/Hed5qcRtC2X1RkMMyXzgoLyEwpsKEWBTs9
         O38KYOx+j0tBkaEG3U9uvoZMjvuQQXnO74P0irCLoQjzgO3/7BQCqRNNlzAhiMzOZJth
         WnwF8TwuLsyTLAiyKRv3phaOrg6KvkAIbRHiYmcKsLuMoNgouDcwvkTVnVbfwen1PdbV
         uOFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769062711; x=1769667511;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S1L1cVkfwEFfqMWQmg3yqS9J1VAzVceKN5SIB14umkA=;
        b=MzH2mo9tAn+0l6buECmT8SKviWWQGUAp/cUOGO0rW3xE8rwR+qH1lGbFFg4SE0fLEx
         aLHprsla3CNjR6wbzs3xqcB0qZqP3Hz6bNqhi8TyIoxF1sLCF/XEckTbFghUdNwTsabE
         KvcaqTWqRCTAz8VTNq2hLFfDS+0EayNA/DP8ICtaRkHoQtT78yogJVFyVuQlejFC6g3T
         7zCORllWuQ2zftG9KxD1HMrz+vbjPUT+NQ4TXyQR2Nr1AqCt0HIFQkvX94hTy7446Au4
         iYEHbfq2Coqmq1mq5dLkJ5XOkeUO7xQYbhueyZF3YUIyMRcXvIk0jLOBv4l0acdYNnUr
         LbWg==
X-Forwarded-Encrypted: i=1; AJvYcCX7nQCwKJhWfm1x3byD2R089xc4QgHh8jYNoiSbSsDskx9x/B68RX6znKhvc6kJe1300MsogquC6hMcyEo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/hqDYSsdrb2lzIKjaBf7EpliKYANTKAeINjIHrdcigrnwZc7
	gbeebSS5rITkbieJIdr35OEcViwHuiXFYZsJ6tS88i1zN53/qbpjX4AnTrrIc5GQANoLbxHC9uc
	KgPEE5DRelYdy4uwHPFf40DA+sILn3mvG+JhI
X-Gm-Gg: AZuq6aIOrs3zhdSlTAdQgXRNZgSF8igF9/gI/BP5nakdPz+bnb9GoTZFBPcSTyiqDqi
	fZS/Y+GnEFFbWXZtA1LXUKHaeIicndKrl7lX7GpMbr4NWA3q6h9lUEthHYUSs/m9vS6pM26g+CG
	azarekvRPFvoPdzkdCfBFyoCqYBOb4gP/KiMD/C87k8ZpcVgqO+jZJAxVaNA1s83kFyZrwtMNyV
	84FaUP+b9BNsJEZE2dGihFdKGEaeSyElJQZL1REGNR8ueZlKym6IUj6efQQhtS/bCqHMouz1H0b
	8kSZhtGnNI1Q9TC4upA3V7FkojDmN7lgTsV+JrbwSQGN2efCwwBAr9c8Lsy+hhT1xjxI9IyZjLA
	yQL1zNDhL7dxY
X-Received: by 2002:a05:693c:6098:b0:2b7:1744:7261 with SMTP id
 5a478bee46e88-2b7174476b7mr1140853eec.0.1769062710930; Wed, 21 Jan 2026
 22:18:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120115352.10910-1-luis.augenstein@tngtech.com>
In-Reply-To: <20260120115352.10910-1-luis.augenstein@tngtech.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 07:18:18 +0100
X-Gm-Features: AZwV_QiCrm9XZfTrxCjNmv7F-U1poGcNl3fPFid7-VA-27Eqn-lgbIS8OuLrpwk
Message-ID: <CANiq72mtWhjVNNYc6nvxuQ3XAnMWBDiZyOvJ1BNN=M+097Wvpw@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] Add SPDX SBOM generation tool
To: Luis Augenstein <luis.augenstein@tngtech.com>
Cc: nathan@kernel.org, nsc@kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org, 
	gregkh@linuxfoundation.org, maximilian.huber@tngtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	TAGGED_FROM(0.00)[bounces-10791-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,tngtech.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 35B426235C
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 6:55=E2=80=AFAM Luis Augenstein
<luis.augenstein@tngtech.com> wrote:
>
> The sbom tool is optional and runs only when CONFIG_SBOM is enabled. It
> is invoked after the build, once all output artifacts have been
> generated. Starting from the kernel image and modules as root nodes,
> the tool reconstructs the dependency graph up to the original source
> files. Build dependencies are primarily derived from the .cmd files
> generated by Kbuild, which record the full command used to build
> each output file.
>
> Currently, the tool only supports x86 and arm64 architectures.

I am out of the loop, and I don't know the requirements here, but what
kind of approaches were considered for this?

Parsing the `.cmd`s seems a bit ad-hoc / after-the-fact approach, and
from a very cursory look at the patches, it seems to require a fair
amount of hardcoding, e.g. it seems we may need to list every
generator tool in `SINGLE_COMMAND_PARSERS`?

Now, if this is meant to be best-effort and cover the most important
parts, it may be fine -- again, I don't know the requirements here.
But if it is meant to accurately match everything, then it will
require keeping those lists in sync with Kbuild, right?

Hmm... I feel like changing the build system itself (whether at the
Kbuild level or even a customized Make itself if needed) to record
this information would be conceptually simpler / more elegant, even if
changing Kbuild itself can sometimes be quite a challenge.

In addition, why does this need to be a `CONFIG_` option? Should this
be a separate tool or at most a target that supports whatever config
happens to be, rather than part of the config itself?

Thanks!

Cheers,
Miguel

