Return-Path: <linux-kbuild+bounces-5095-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033B9EF04D
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 17:26:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1652B188B523
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Dec 2024 16:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25BDD231A42;
	Thu, 12 Dec 2024 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EbM6v0Qy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF36223E61;
	Thu, 12 Dec 2024 16:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019555; cv=none; b=e3yFP+atYz17ByxpeeVCxZKO05ZKs26vDLbwHWa3YbdrzI8IJkVbMDHzuMpLEI4CZMM216qBHFLcnGJnU32+CHu4IczXX/NdBNwVmgBZdKjhOQ+8A1aSZMSvKXIYt1QtKVRKuj8jxSX23wA8n5E46sTcDEZmvCI5NKJnATkZloc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019555; c=relaxed/simple;
	bh=1thxMyObyFIfuoA6BeWJHGda6gjxV1E3JNYjUL+Psis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6OWC+YlDS6DOMIw6ub9XMmgg3iemTfioiO5Qsdu1QSB6CkXs+6jpU8BQybi+rzMl3iNXb+NSbFEpv6m8/Knlw4+L01njlYMnYQoVsa71VNHRYuBoIRTKEi6WvMLak05beifVQxFxju65ydXgjutlRXRrgW7hpRScTUk0ALORD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EbM6v0Qy; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30036310158so6180821fa.0;
        Thu, 12 Dec 2024 08:05:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734019551; x=1734624351; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1thxMyObyFIfuoA6BeWJHGda6gjxV1E3JNYjUL+Psis=;
        b=EbM6v0QyQUN9H1ndc84M/LxqukIG3zQ9p5lSTERzL6ugRUYxb2uMH0oMuDgfrbGcUx
         G4CIGFeZGc1pE+V9JXOKWcVQwXa57Z1TJ3oxPMZNdTraeJbYAguLi6q3XDYUjZfnqYoE
         ouQUTium5h4l4WDgAyNs9z4aiXoVhmVRRa1xClvh9vKnc3q148rS/BXOATEl+3mHJ9fo
         u3tv+D+kRufS3n8dwvWvIe2k6+K3PVBCu3E4lUtXXyVVqqqELgt+C+6jScXnwDgfdTmi
         lS8zJwX+7JR1tR6s8xbiW1esnLM6AT173wLCWVJz/6f7Trp85NTn6Wha+3pwQllMvNgC
         zqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019551; x=1734624351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1thxMyObyFIfuoA6BeWJHGda6gjxV1E3JNYjUL+Psis=;
        b=VSoznTRMsKuBNqi3ktoQwK3QSsnMUGacUT/uqTuYBdGfr+lDnIRDzK1uzUt0P9R4IK
         LvYtNvENVacvo7E3cUEnWpGJA0W7hl1WaQSsONyEiVsS09ERNP1v08ILdlynTY82AFg4
         MqkSSNCp9Ft9gozBNhjAf8SqOvOsCz2JBKSjeNxRKOanir1MS4beXopLYDw90YV7F3+5
         f/9LkgWVorUVgwkvmVBiaoe8t/cVoQti2kGAsAQs/LgQWWCplmg0laB2OiPT68h6Loco
         eZoomHtxM0wO2Ck+XrdcT1AO644xq11orO5E13Ihsm6JNC3XF1qZoMkQ9jmHgItrJVJL
         OLcw==
X-Forwarded-Encrypted: i=1; AJvYcCUnDAh2ACe27SYphz/48CGtREcD5DFXQ7gPXdlGgojF+9ISGVUWPu0ZnkBDW2Tmon83Zno7/unqDbQG8Go=@vger.kernel.org, AJvYcCXIk0k9semtnCjbkQaaikGiuGYpq3jyk0y+kdwB0yg3zyvtjqpMWsdvDdex/blPqjVznbGBLWRmhfT+wtSgRoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuEsg6LJJgCIdDc886DqTrYrqJ2fUa8HCg4tYGyrtMoozhLWl+
	VaRAatGQqDdjfcr1LksTHbNfS5d3QXgRfpPvA/xvfGvGg9QTw12QqshN15SGSkspSErHzf/qCH9
	wQ8vpqn2ptyCmPwHYez7dlZKNw2I=
X-Gm-Gg: ASbGncuZcdm6KBJifLUNDRiAnz72UwKPYcaUjGBNFtzHFPID0uy673jcoX4qy6PdHwg
	ezql4VF+F0zlBuQLRBdGgnVk8TFs73K1SP7bgnz7DcDVbvp9bse1lFQ==
X-Google-Smtp-Source: AGHT+IFE+6Rc5RJc5XJHUWw6nvGAlQm3hnhguaQKwSThJU1hjnm5dxe+wawq7AtB56EJJQ9yA1Wir1mnVO9DVrRYBeM=
X-Received: by 2002:a2e:a7ca:0:b0:2ff:c349:8d08 with SMTP id
 38308e7fff4ca-30251d08635mr2952721fa.8.1734019551077; Thu, 12 Dec 2024
 08:05:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241105-b4-dylib-host-macos-v6-1-4e66515e6630@gmail.com> <CAJ-ks9nbwwtpO6TX3zM2Embag_7RQMfA0iBhtS5TS44wx1iOQQ@mail.gmail.com>
In-Reply-To: <CAJ-ks9nbwwtpO6TX3zM2Embag_7RQMfA0iBhtS5TS44wx1iOQQ@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 12 Dec 2024 11:05:15 -0500
Message-ID: <CAJ-ks9mu8igfXUNhitctB4Vp0WsqPwsoe3Wmai4DCjmBKv3FOQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v6] rust: use host dylib naming convention
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Fiona Behrens <me@kloenk.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping! I'd really appreciate a review.

+Ma=C3=ADra, you mentioned you were considering using this to build on macO=
S.

