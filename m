Return-Path: <linux-kbuild+bounces-11328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABwXLAfElWmTUgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11328-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 14:52:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0D4156DB8
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 14:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10B1C300E3B0
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Feb 2026 13:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0600F328B63;
	Wed, 18 Feb 2026 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Togdtpcr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1F4328B40
	for <linux-kbuild@vger.kernel.org>; Wed, 18 Feb 2026 13:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771422718; cv=none; b=nd/mylzMRnXU75MNBoYHPPz3g+BVieEs+SguKdBz1uzRKjvuu5GlXRFKlfhZw1vLMOR+e0dFn/Kwn1SDroxpktYHKc+5ApOad07X2xEP9llBIOlHZo9Vmkw4SiNr2kWCggidm0aAfyRg7KP4D/3DVGvkcbEQO1afO5NqHLFmzow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771422718; c=relaxed/simple;
	bh=B2gk04B2aeaqoOcUpyvWb8TroOcFFUIngrROjwLCGKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpIVr4kp5KlQCQaSffc4uIQjdEK+OOHDls3Gsty+X+bNEZsXResTPLhUV2Gb/CgkAb+ymBoOzihaZgQrS93t9yAi5Wgnbv+83T0nUZCbs8V26bsPykkvXaX5u+N+v3u6gML5DYDbRbZXQTNAiWlYt/Oms1HVGRzX9f1nzWpFYRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Togdtpcr; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359a16a400so5127156f8f.1
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Feb 2026 05:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771422716; x=1772027516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rYx47k8dyRpM97gMYzAlYbIru4B1EN9fBdkfbNWwdnI=;
        b=Togdtpcr/mIFtMEyXcsO6lnYEpoeYsXgoJhypgOceBguqcbHSXChmVHeO98kJAEd60
         WbAICdFUpmR1J4B22RCQoFmFtIb1ggVETRMo2PqI3Otfm2bKJa+5cLTxg560oSXclW0Z
         T3ZfERiFg0FH+5dUAOc4h9XQuvYnxJ8+UgyCdsODrQ/6Dopz4XmgTYBw20T/wYXRBAfj
         tEw/vd+U7SezgVIUsqJ56n7pTlhqIKzmhoj7uVApXmUfs+cxAjfEpRjJBLyAc3bOiGM5
         y4sTFime+kwXkioCSCsBoPXI63Jh4tfHTqQABZUI7useck/QNf4/6V+ITHK4Pg1uu7U2
         6k7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771422716; x=1772027516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rYx47k8dyRpM97gMYzAlYbIru4B1EN9fBdkfbNWwdnI=;
        b=aaolgZ77d3xVvLyi4IK2iEBFdIfWdV+V5fsEUIGeHMHJl9oie26wedFQid21pJf/nA
         imwC7fvIH9ugjz/4ePNnAKRAZHgAQ9HW0V258eqaYrX4ImSxi2mCu4pApp5/uDCAJeCu
         GeaxunLNvztctetE+JDB3dx06flDIAVCXC5FqbocubrcA2IZvW5rvs/Z5ScOHifEZXhZ
         zmz7WByyr/He7s9UtFHaUD6aOt9VWBgbjanpk37tlzam0CnlwKK+lqikLZmw0IenL+Oq
         D2daoFnQrSOsqY0OhkwQUnMl8I5MBtg9bUo2UCEnGGOcY09g3uzOb8tNDsi5J33PrgGS
         mamg==
X-Forwarded-Encrypted: i=1; AJvYcCUuXLzVpa8z490Q4Yja9c0NI7h6sPedyHFRL0OBRThz1HM15mRIeE79rY4lWQEMC0f+nuYxycUVPLTDSow=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBjiYVoMMBXD1o33/qwgY+7n78GlOVFK9m57sVTztSJurDym9T
	TCkNMx0F8RHUq8FZS2jLBcyImQEv8HoyUgIy71ixvW+gXj76Q28yHVa1
X-Gm-Gg: AZuq6aLA2ecJWofLfOVrXXke/eT0hxfwiUpT6XpMZ0EY7m+yeSN7r67QkDHaR6+v9y6
	mxNzskdnXwFeUMVrV/gCh7tWYBB8oxpFYu8yLeiSgw0dTgKgqpBoIiYaQiaxNQU6/YlSLInrYUK
	E2IEaomgwXYV8ZLlR28qBEx4HyUGkgZ//rI//OMv4cHnbcjGbMxFz29HZsS2m3wFIEHJ4pzeMl8
	SQoBFhk1mNBcV/5agLoIDWTmIiuWBkycJju0ia8bezlNYF380V28qTDuRMixIIivvju0V0bBU5w
	c5cHc/5MOsvzGZ6aOHABjk7cFf7zdjpqq8U5jEyinfJDNS1ByYo1+XDfu+xncxgnjTFZK5wYoOC
	Y73iW2jUTKeijJ5+Cc9JT7ii4V3oLIYyhf3IGCja17NNoYTj8TbG01+G+uDPUMGEKUxKO4kW7BC
	tRC2KRTkxa7Dea6Qza+ds2lIWFInb1ngS3Wy/rKRXZ7DyxxQdPDWlNKQp+fIhlZbi5wZ4TyLoN9
	LJNhdDMqd72B5sgSIVJ9r5u+nb/+9Dq5HLZBDn0EibAyjE=
X-Received: by 2002:a05:6000:2882:b0:430:feb3:f5ae with SMTP id ffacd0b85a97d-43958e57504mr3195980f8f.55.1771422715780;
        Wed, 18 Feb 2026 05:51:55 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a74918sm42069851f8f.17.2026.02.18.05.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 05:51:55 -0800 (PST)
Date: Wed, 18 Feb 2026 14:51:53 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Levi Zim <i@kxxt.dev>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Namhyung Kim <namhyung@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v3] tools build: Fix rust cross compilation
Message-ID: <47mkwq2jzflgnswzvtz6rflu5hi6qlg4k55plizxj3y6fgqjb6@qbfqtpuwqqek>
References: <20260218084736.33114-1-9erthalion6@gmail.com>
 <d1a55d2d-b2b6-4763-a6b6-c7aa843c43ac@kxxt.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1a55d2d-b2b6-4763-a6b6-c7aa843c43ac@kxxt.dev>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11328-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1A0D4156DB8
X-Rspamd-Action: no action

> On Wed, Feb 18, 2026 at 06:57:18PM +0800, Levi Zim wrote:
> On 2/18/26 4:47 PM, Dmitrii Dolgov wrote:
> > +    RUST_TARGET_FLAGS_riscv	:= riscv64-unknown-linux-gnu
> 
> riscv64-unknown-linux-gnu is not a valid rust target triple.
> It should be riscv64gc-unknown-linux-gnu [1] if this is applied to build user-space Rust binaries.

Indeed, need to fix that, thanks. I've double checked, the rest seems to
be fine.

