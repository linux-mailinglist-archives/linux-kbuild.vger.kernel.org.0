Return-Path: <linux-kbuild+bounces-7183-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 267C7ABE431
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 21:56:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 931408A2E49
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 May 2025 19:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB4D28313A;
	Tue, 20 May 2025 19:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZuDv6bt/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533AE24677A;
	Tue, 20 May 2025 19:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747770973; cv=none; b=HBTWv8Ws+pYhJOiE6m4ByBvwgK2tePxUMQ2vfDYGzdKZ5JJh+lK+ut8GGEWpkRjwWDf88RcQqw0Rqrc819JQDSYcfMD2eQa+fq5N5REjcEj2zFyBg/1QA6K42qCRsKbDPVzG0Os92d8sqlVYfitO0/SWtPlsrw/1VGX3jbDQieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747770973; c=relaxed/simple;
	bh=5rxbJNyob37QGi62KumFHH2u1FmRDF19BAX10oWgC7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AC6zKf2vNE6shVf+US1E/s14V0DWR1rW8Dsle5IOb53bvpKNBWIRdr14Gk0zhE7SLzWpMTOES7oDne8V6vanZD2Jiqm9gbDqgpognhEyZx8QGfqdGgWtp4MQWqru8rhrFEYc4aZ64PecEXbpp+woRCJFahoNGpoXF6pnFUYMeZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZuDv6bt/; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b078bb16607so420543a12.2;
        Tue, 20 May 2025 12:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747770971; x=1748375771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRXK3+jUaFquyfrpafb1v4VMZEAhC0R7dGXYOJ0ETTQ=;
        b=ZuDv6bt/ZjeKvmGJNY4EGSMtQGGiD6waD7zaRH2t8CCL/2U35U4kxEM3NEeydK5kDG
         CI202NFOu64Xn4YhTYPX7fT9uqdnZTt2tZma6Gre+gdLIgsvLnFvDKXO9gtFYRfGIcvP
         DbtDWEkpsbUdH9w3ECXWs18YxcljNZ8g5/qxHu4aLusvUuR3CkiU9Mlbpe00yBWoM5vN
         ju+fCJDbnNXeg26wNQzIptJcZ9YZbblDoK4dk9QX2wrOpm+9nHSpkJ3VubSEgNaqcOCT
         b2kSJoKJlM5qfB3tXS1jAIlXBgqDDQq87oD/LmWEqeR/uH02SeOeyVgLmzfT4gK4B0pE
         lRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770971; x=1748375771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRXK3+jUaFquyfrpafb1v4VMZEAhC0R7dGXYOJ0ETTQ=;
        b=D9Xop5oMnMY6N3Eriw01uEacw6GUgbLFG3jXNG5YJne1QzHz5vWr80S7eU7wxoXjoS
         ERsjaDjc7lU2qewv5HOsZnlwGZcPWYDKFP6qbV0lBGFZnIY1RxZTWxfeJetUkguLDmip
         AvvxbntjKMuxyesVla00dVTqSXSUIa6A75EMShjn2LGUDg2e1JIcAFlwvpms7gz6rccI
         RL9biOzvfYHdBsW55jELS/bOnw+GrPL9n7dqqMtpU+TiIJkO/T68rOofZ9l0PJ6R6ErV
         rWidOOf31DuYmPYhQCZTuEHgaTUuqoh5HZ5g6EWFiHU76/e4bBMab4kUnHH6Cs+zbSVO
         BD0w==
X-Forwarded-Encrypted: i=1; AJvYcCUCPy9N5xf5ieVQ5amPnlu9Yif4hOWz/4/uwJJktYHrttlu9/IG5PBY6Z4U1DF8EF4k41UBccN+@vger.kernel.org, AJvYcCURxsE/wJrgq23U4xkKp33rooRQZxnv2tXrw7eK3d/BGG//tMAoyjN7yZQknlCq8WXaRwRRjNP9xexWWgZUOJY=@vger.kernel.org, AJvYcCW5Mteu0RLFZg8LdcHGgJMhViA+xs2mCL7nAeIvr8qG8yDCngzQ5gYPFQr6TjxPGnR4efrDehBEcj9Jq9Y=@vger.kernel.org, AJvYcCWmRMgkaGh9WG4mgFLAj15Xk9sY7++UUukUY2f+VO3tu41uKrpBVx3WWV6BGrl50A+Tccc//am/0BmezwUq@vger.kernel.org
X-Gm-Message-State: AOJu0YyEvpg+ORJKv3NM2AmHOztiJ0g+Z48S34cOYwUthyw28SmeJ5vi
	lp3xFW9b/q7QQdEQZn1PJqLwBvDDahCQ0glYIqt8S1mbtuBbBblkTUtHEzTEY2iV+JrX5rjZtJq
	q5vLOj7pRur02CjAa499Nq0xn9ptMDEI=
X-Gm-Gg: ASbGnctkM7kvnYIdP3ET/Zwb7BBzzAofIE/xMxwJORowK2xRElbDoL1IMvGK5VLaGw5
	YYBibicSDPWS0H4Rg7BW1EUJex8sdCo1+1KYaS1o3a23iNeLrOzFcbhn23BebvmEsvMH8NoXsdQ
	oXR59tvxccK8ZuZst6GyvN149Xsm2Pv8gc
X-Google-Smtp-Source: AGHT+IHMBgCvJ0ltoJP8XtyEBtuP89NjkLllHvz/zazFd2sBhpBWXHheguiDfnpgLDlesaU0sRxIYGwKHYkjm3yfw88=
X-Received: by 2002:a17:902:ea0d:b0:224:1579:b347 with SMTP id
 d9443c01a7336-231d43c6220mr96308575ad.7.1747770971470; Tue, 20 May 2025
 12:56:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520195345.905374-1-ojeda@kernel.org>
In-Reply-To: <20250520195345.905374-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 May 2025 21:55:58 +0200
X-Gm-Features: AX0GCFslC1rHS0JBz-WpDnFZ7XYTlMemOVnCBI8Wl1ZLSvxJ1ZydC6LVz9_6R4g
Message-ID: <CANiq72krCWthBMDe8XEJP6knDS9dHn3jSkTBhF-CPBUgmL4oDQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: kbuild: rebuild if `.clippy.toml` changes
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Tamir Duberstein <tamird@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 9:53=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> +ifeq ($(KBUILD_CLIPPY),1)
> +       clippy_toml :=3D $(srctree)/.clippy.toml
> +endif

Not sure if this is worth it (see v1), but I think it works, at least
from light testing.

More testing for v2 is welcome (v1 is "obviously correct").

Thanks!

Cheers,
Miguel

