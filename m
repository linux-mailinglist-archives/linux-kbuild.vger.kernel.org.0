Return-Path: <linux-kbuild+bounces-11454-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIEfHUGYoGnhkwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11454-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:00:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5FB1AE1C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 20:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5040932088A7
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Feb 2026 18:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C75AA3B52FB;
	Thu, 26 Feb 2026 18:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtEut1M1"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E6535A383
	for <linux-kbuild@vger.kernel.org>; Thu, 26 Feb 2026 18:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772131245; cv=none; b=SmYlvcaT6qX66UKWyK35QYNBTvklaHzS1006osOnCpQjIEr7jUKxzVFxJRW6RfJfXVXBix/xqGaJYL+WZKJQ4CuONo38EAdFy+hAFbQkclbdSb6AFDTcM0dkSppD/OM74br46oPy3YG0TixJ0NF7Nx6ibfFnJMYJ37M/D6+ycJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772131245; c=relaxed/simple;
	bh=5ty71ZP/kn9UYFYi5Gf8attnjAgfMP8XR0y3mMnTX88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXB83sScKimDubpggPOm68r6KXGUx9l2mHflol37EeYhe/YWf2HhfRZv3dqO9gjU6uAWcx8l2TzaZUIxQ9hN4tR8BkAO/FeQ3i8f7osYq9bPGk94i7XUep466ZEsUjzv4Gs2Br7LAMlU5Ahr7J2Hfb4VYB8iDCHWMilcTgTdbEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtEut1M1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65fa4713bd3so2308117a12.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Feb 2026 10:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772131243; x=1772736043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ty71ZP/kn9UYFYi5Gf8attnjAgfMP8XR0y3mMnTX88=;
        b=RtEut1M1Hf7ppzqlx6DFODu+jXyhzXeyJ4Fgkv9Kq0aWDsxSq491Bs0kaIapAgANAm
         aTceN1nrdYtBVzb9tnge7sDTs5tGLEhoIc5Dpgtq4y1rIUI5cULRGr5ahkz0wrI2S7Qz
         oCOkNmo68x/7Xv3jza925NTcvh67rk/IaHwDzLTrx+DAXVnZjTIdi1ESpqNxxAD83wID
         S6zul0ykh8Y/521rRsjfJjCEEARESf/4E2yZOJhIDBJvtZz7VUmyybVzkzlyCiQunUhG
         UpXuE93mRXJZLmJMcr6NmDHgDdKWOM024cHZuBmfIqYotDXfJ9uCh30Xn1521aQThXAh
         UBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772131243; x=1772736043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ty71ZP/kn9UYFYi5Gf8attnjAgfMP8XR0y3mMnTX88=;
        b=j7tvh70/dw+GaALwlk4h2npSak2n+GGpfGdbAN6DPpcW3XifxELz40rvfiIM5BsE+U
         SI8S4vx2g+RorgDRNsqxy/pJ4CmfnmiibBRQpZ3x0Eik8FyNKLosyqvztU7L0Hb+Xw6t
         HcT164mZHOG+Em5zAc+3Hu5aVg8oQPr1z+nIuT1QwPGRcuI5TQg0JWV1rb7rs3BmHnSg
         9Zky3e0TSAg3pJskJ8cYcp68Ka7KNCG02fwcdb0O1YVu43SdlpoZ1ljPMl1KRAo6jzUZ
         3YJFnfcc/BF5BpczdxzcAHgWCSOFe8XRWJqv5mZME+reeYZhQC/kTNGgOJItxN8kFy+l
         t+lQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWDrN9l35fhc/QMuJiviTG6uHSAiZ7sgN4FHy2aIFoWcZS9Gzpg746Ay1Bawo935+lVevM5y4gBznzA+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzNs4iQLizpZ4rZjj5Md3Y/piZgD+VgDj6eWq5tw2jNUMXSy5Z
	APduR+e3PWG49792bAu0rGHoxJ2TwZXTCxf8eKyHnyyX4hm7xgEK6YhB
X-Gm-Gg: ATEYQzxQ3BYId4yhVGc1X+rT//m0J2BRrS2Cgr1rvufFpWEKRBNs94G1OxeZwk+h5FV
	q5h9zxpLPT1obcU+gXmZJvfGG0ZisXTM4RB8F6jT6PCHfsalQ66cRGJF9Sl02JK6wHyrPvgL9wa
	QRSsCkOyr1AqtbRUD0Z22AWlrVr+nA33/lC6CVGkVwDxrjQtPgaw55Ni3SZT3vgZ2gY1b+svKLV
	WUM7AwEeiLWvRlhUaJ8isGEBhXoPlqlcNiIgFiU8CArlYN6qLgJLUzL85cBEcdKG9AzJlmtgKUu
	zA2yjM2/s5CYq8pqydesUzmv44G13ZHTtf098d22nUdztdxLGTSbEOZ218BH5Hx6EVe+VUYPjb5
	J+ft53hsr/6HEgLUkMUORQwh/Zx1P06OqkORxGDHGKnLMVXpeWnGx3C49cV5xLlM3Stt4YsyuNB
	UCTVBXlxHS4JPw52s+HhOu/g2plsRrF2I0XIYxuup9j248WGQBRgraDcHRdbn+jajp3ex3cb4rl
	sbWSx1+J1BBi+mDCY4cmki21awpVjPlNolBt89mYwNN0cQ=
X-Received: by 2002:a05:6402:1467:b0:65f:9c21:e69b with SMTP id 4fb4d7f45d1cf-65fdd6e2ee8mr211415a12.10.1772131242711;
        Thu, 26 Feb 2026 10:40:42 -0800 (PST)
Received: from ddolgov-thinkpadt14sgen1.rmtde.csb (dslb-002-207-075-089.002.207.pools.vodafone-ip.de. [2.207.75.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd36219sm669054a12.3.2026.02.26.10.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 10:40:41 -0800 (PST)
Date: Thu, 26 Feb 2026 19:40:38 +0100
From: Dmitry Dolgov <9erthalion6@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: linux-perf-users@vger.kernel.org, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Levi Zim <i@kxxt.dev>, 
	Namhyung Kim <namhyung@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Subject: Re: [PATCH v5] tools build: Fix rust cross compilation
Message-ID: <mnakvrusyjmuq2zwdjataxq5wc3m4bhyynbwdku2s3kdvtsi5f@2n7t65aqbupy>
References: <20260226170025.517743-1-9erthalion6@gmail.com>
 <CAP-5=fV7OuWN9K-wnsS7zza+s0FQRSR_JCcJi5tvpgQAbh=Nnw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAP-5=fV7OuWN9K-wnsS7zza+s0FQRSR_JCcJi5tvpgQAbh=Nnw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11454-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[9erthalion6@gmail.com,linux-kbuild@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED5FB1AE1C2
X-Rspamd-Action: no action

> On Thu, Feb 26, 2026 at 09:10:24AM -0800, Ian Rogers wrote:
> Not a cross-compilation problem, but is there a way to pass-through
> extra flags to the rust compiler? For CFLAGS we have EXTRA_CFLAGS as a
> make variable, but I don't see an EXTRA_RUSTFLAGS. I was looking for
> this because I was trying to make a build passing "-m32" to CFLAGS to
> create a 32-bit perf binary. The link against the rust workload was
> failing due to the different object types.

Nope, not yet, currently one can only set global RUST_FLAGS or per build
target. But sure, I'll add this in a separate patch.

