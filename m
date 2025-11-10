Return-Path: <linux-kbuild+bounces-9515-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42568C46F9F
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 14:41:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34E53188C5D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08753128AB;
	Mon, 10 Nov 2025 13:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA+mM9/n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7324C31280C
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 13:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762781952; cv=none; b=TsdAWUy/uNhSxZxepNzkOS1cKTyDmpAfT2fVcPaJx58fjgNNrZrfraPpQDk1RCszdf7kXoOc0Cl6J3zTqUl7AogOZCeRwewEohRVul/XClQwu/Zd113nwQBoz9mq/YvofUvraT9VLoLpZkv3wraLeG8qKntI9mB/xadRg36JvY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762781952; c=relaxed/simple;
	bh=JxxNv3zsqMj1Gs4mcPxMIFOWegAIC0ZVsqaUYW8cbJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AacJF9/Y5/Jlv4mbaZYUOLs7+bpDVmAJ8VRrKTNinuk6F+jzGH/Ob5vItTdFWluCWqBHvQABILzw+W4O1H0lsF1yfpzTOnfih/Od/YkTmTRoHcYMuD4UgQuOr2XobWKmUr619g7LL6dVAXOZ2FRPx01E7f+ju6ALaK0FZVXl2ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA+mM9/n; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b63e5da0fdeso279775a12.0
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 05:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762781951; x=1763386751; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JxxNv3zsqMj1Gs4mcPxMIFOWegAIC0ZVsqaUYW8cbJQ=;
        b=VA+mM9/nNv7CLjjgxUpggLDb1EDI7HiIhGR3KA9rHkrX82RpM1Cs9YSYkuC74LfENg
         PmnB/mmGlAbiwlw59wlngTGJdEoVoWJXS5eGCoo2gC5EhksQHfV5+1zb59r7Gw1E53De
         trp3mx/BAuZ1UlmlsMlOfo19wzjHsjkVkCDFJqTZ3+sjPuK97GnN37n3iXfkyBim8k5i
         tVRCZuZv1OlEJY2DRKTHzokEu2kclBLLmlyYGzg6FB0F3DefJPi1LbnP/gPl4+Q6AYyA
         FoQRXhis8MhsLXLwvQ0kMbLjNkJdnV/TMQ8EqdyKsc62BLjc+z1Pm8ZtT29PBQ1qvDXm
         5hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762781951; x=1763386751;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JxxNv3zsqMj1Gs4mcPxMIFOWegAIC0ZVsqaUYW8cbJQ=;
        b=Ug5TKNe87Sn7niLJhYewTlQyKiRRLKNnhoE3pDWp8BQTIsedJjAMu1jlHpNKnt7Ty9
         0N0LTHKoTmVWUva0wP784E78bsk+f9QB5pnJDdKcwyWiXTsGzjVQaIfMBSQCDEzqnXVe
         june1oG9/5LXCgdE0HwxDB+P7zYDGTJZ/Pm5IqmLzhgd+nYysAtBlC/GLn0etBVPZHam
         AL/Hm6xiziDjagTCssGvq4Pk5RDjK9Qj7bqiKsRAVHn8SzLkKgRwv+4ILXl0TXHXVB4V
         X9WlqripW10wMGWrPZXqX/sHFK8vHj21tdRGeoDXuVxs8JEze1/XTqZxIPKrSHk916LI
         YN+g==
X-Forwarded-Encrypted: i=1; AJvYcCVQjFi/26nMl7YKA6lNJp4X9Glj7iOcqkL6ZVN2JYfftuGanh3HqDU1lX8O7DPvHxngNBeaHworwE5LMeg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz24GOVZUKdfLOoe+cgB5G6buA1/3HfCINXR1KEm3U+QRlf/RW
	RIAjVLxlDFeCcLTXjfhI+ww0xFeZZaJ5S34ey58Y7J0ucdS8mtYrm7GfeVF9CmBpMp+u1QEXG/L
	8Cl+Ll4/vkcp+MgLj8WR0LJHLr42qmL8=
X-Gm-Gg: ASbGncvccVyaHq51RttaIkBcNnLWUZTsRjhTwfCcGG3/xCf2RK20tb4NT5dYso2k6AI
	H/mG7pDU9yrk/dzQvduWcVx7vlE6HAnKYBtIjGqv22tpTEINAfJK5LylegV36QPEdOxA3s/U+Ec
	EoAugtpVZ8tUcIOGIz3iuCj/3c0eocU9MzXVSor7lXdA2LWoVi40JRhDQ3j6xwWWJYrhHv0R5+j
	KW2dExPSuN6hwLds1s7AcignLGvLyr/48zhLwMYzDN7cVSEGTlsctLGd2a9aeJIVHUda+PXYYIE
	kBQRI01SwZvCmnVW9b9sKzypZSp2/S+u2CXRs2NmIyoLtZcBCoSM1HP6mW4b+wLRUxjb/7RzOAn
	sVoc=
X-Google-Smtp-Source: AGHT+IG/R5OD4pp1OFOM9MYMt9/Bhul+bEC+eJ9Gapoq++XiZ8PPTIp2w0OLJEaZ5ptFkMI9E6aTQfedtmXfsk2hbhE=
X-Received: by 2002:a17:902:c409:b0:295:3262:c695 with SMTP id
 d9443c01a7336-297e5646bd4mr60288355ad.3.1762781950762; Mon, 10 Nov 2025
 05:39:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-19-ojeda@kernel.org>
 <aRHRYbHIfxMQ77eh@google.com>
In-Reply-To: <aRHRYbHIfxMQ77eh@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 14:38:58 +0100
X-Gm-Features: AWmQ_bm55qKIiHG3q93w7SalH37CbhDBzqfQWzONZGIL-nfi2vUYjlTXeaaq0Ug
Message-ID: <CANiq72msN1B8c8QFuH2VK40xXY3=uGiGL=YgAo68o92LTO=kLw@mail.gmail.com>
Subject: Re: [PATCH 18/18] rust: syn: enable support in kbuild
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 12:49=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This change seems unrelated?

It is needed to actually use them in proc macros, e.g. to build the
new `pin-init`. We could move it to that patch series, but then it
means it is harder to use this series (e.g. someone was waiting to
port other macros).

I can put it in a final patch or perhaps just mention it in the log,
similar to the `quote` one.

Cheers,
Miguel

