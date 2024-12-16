Return-Path: <linux-kbuild+bounces-5144-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E439F2DA2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 11:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0350B167012
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Dec 2024 10:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3532433B1;
	Mon, 16 Dec 2024 10:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ipKaYN8k"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAB21C243D
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 10:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734343273; cv=none; b=W4eYWDmqKLz3FeXxoyJM6PZf/5dqNnNOBhV1x8coDcdoJ+qtHb3vUaRqQ5V/GOgpzTi1qk/pgN/KTk+vb5arrngxuMYIdDZ42jpJ7u2sWl4xlnSkd3Luw8SLTZJrtM6Lz+9w855YSxypm9Y7kvciEVHxoqUO/eXlMgXdJnDxqS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734343273; c=relaxed/simple;
	bh=8o5jTEa5ebzOtzZM3gpGo3F5kdkUdqu2jYjbHg/1rL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UM2a7JXZtOr1xbVfiVE/mEa0DA9npgWCVCWt5bXvgPR2xh/VCHf3aSKvy0rnfSMRQYQtf5DSnCdZexTLmxq2UnGnEbjz7ZGBdJOk4KYZs9Tcvs1UqHp7yyhaRtmHa9TKALA1m4DfiAeyJEDRsicSrRNXWzza0MP3xJJgF42DoTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ipKaYN8k; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467abce2ef9so378191cf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Dec 2024 02:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734343271; x=1734948071; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwq5ggD/nJ1Jxh/jaamtYJrA0D6FiVs9BLcdVRZw1ww=;
        b=ipKaYN8kPyBHJFXpafErK0vga4oOXRuEHtVw4v8hbMgNCfDrKaBzLHw3wC0qdtTz+n
         IUzkKL1ikjNaFdKxj8xap0mWN4EF7CD5gQro5H+W4RFGsxR0Zu0n7geOPKQCtGvLNWs3
         goBZ0Gxo29JrEwo6TbXUvMOyWubyFAWznyGE4n5M71aSnsc6qTO15AXdJB471PrtFX/m
         q77/2drJNAHyK7HiUwOTJfC5r6yR8wUpM66lJCHbzccjtWH0Mmeik+5RYzk/ehMVELrf
         4flxHdg4BScGW9sC5rxubbvfB+Tys/cdAdKDMlMHHneyRXj7mk/jtsgKu58mHBid7JtE
         gGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734343271; x=1734948071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fwq5ggD/nJ1Jxh/jaamtYJrA0D6FiVs9BLcdVRZw1ww=;
        b=EqOhsR2z4aVXHrVDdXt8zafXDJMfEP45WXftMB8p3f+XWRBSRE6Wrh2t+OumOQxlo+
         nEF3+lHzz3lrsGHqa+A8ylcHam7KOOXX315IDqMf1cwb4K/FT4yqSLU4ExP97WSh/NS1
         6TWtlN3c+gTfdt//Bmt1jxCMwNq4t4AVt4DDTgseyqiNAbJHMEaS0QX2wWOIlsF8pfP+
         IvOiHopMEUtW4rck1/dBHoRBFUz+2GfyV7Y4eDhY42He01pD7XQksTB1uZ73T8mb588F
         9BpUqX7ELmJGTMtS8M6sLgt2N37zi9jEW3NXkC6KUBKlp5ndWqYYYxVkRFO7E97Q2jYW
         xL4A==
X-Forwarded-Encrypted: i=1; AJvYcCWPIAL4kzWgvly2H3u42wans4qq00it2vMyb1MxK6Mu3qzQfcvfhRBKsm2hHX0wJPy7jRQvIOdgQCs7PwA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iVhLVjsf20dEyfNzzMquqhZmcAUrUTsMPXCuQtuqwas3Cn0z
	hRXaKWwiBEEAT3iqaEFOoJwORP7I5bzmwqj994dts9Cf2Fjs2Ii7plFkEg1q6aDp8akpt1ydMuF
	bO+5qDZ56U9FWoH9ah9kBGlp4SLQJ9/vVdsOL
X-Gm-Gg: ASbGncuN7kdfjTmW0dXWc8U1QseJkyihGn1D5p61+LH4JbTYp85Oo6cGMoUeZ5BvHXm
	3W/LbSSRnCFeGLobCbsyAv07BuNhjSGw5L237M6Tj2exjCpxG2q+EhmBwX8so4gvdnTc+
X-Google-Smtp-Source: AGHT+IF5D+bUUP/otSIqXEjmjhLQdoX5kqC6bDKYp+Tf1iVR1unOxp0lNb68N/rNej8OuotRJ1wjQNALfXpxk6UU8sM=
X-Received: by 2002:ac8:5d4c:0:b0:463:6fc7:e7cb with SMTP id
 d75a77b69052e-467b4a283a4mr5464631cf.11.1734343271175; Mon, 16 Dec 2024
 02:01:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241213-objtool-strict-v1-0-fd388f9d971f@google.com>
 <20241213-objtool-strict-v1-2-fd388f9d971f@google.com> <20241214005223.f2fansikbwovm3oo@jpoimboe>
In-Reply-To: <20241214005223.f2fansikbwovm3oo@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 16 Dec 2024 11:00:58 +0100
X-Gm-Features: AbW1kvYh0Qp40TndjYKL3Uwl01lOD3gETa_kj_WPV9X2f7Vg1GPRlPG5NP24GBw
Message-ID: <CA+i-1C20dBQGYU0gAJ7BGfo7ShSYSuZgB0Gr_Y-ei9gqXq83zw@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: Add option to fail build on vmlinux objtool issues
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 14 Dec 2024 at 01:52, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> Note that *any* objtool warning has a good change of being a major bug
> in the kernel or compiler which could result in crashing the kernel or
> breaking the livepatch consistency model.  So the option shouldn't be
> restricted to noinstr builds only.  In which case it should be called
> CONFIG_OBJTOOL_WERROR, analagous to CONFIG_WERROR.

Sure, sounds good too.

Just to make sure I'm on the same page - are you saying I should add
the flag to $(objtool-args-y) instead of $(vmlinux-objtool-args-y)?

