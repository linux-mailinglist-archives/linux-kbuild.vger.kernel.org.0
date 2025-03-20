Return-Path: <linux-kbuild+bounces-6269-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 226D6A6AF10
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 21:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FD2A983ADF
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Mar 2025 20:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60238207DE2;
	Thu, 20 Mar 2025 20:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jPxKrVSp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26692A1A4;
	Thu, 20 Mar 2025 20:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742502114; cv=none; b=ncuhcBUVd4O7TcVqHlEczZHvzXwVMbEWMBa6L9E5rdCV8NRXUp1dnI2mwrUTHr9ICUjj+YG3dk5adsHVcZachc3o7mMMEdno3a/pJ0fh6yjE3iX7y5395eN0TlqfpPYaep6xGE1OnAJVpgn9y2G30DRT7UBbinVPqWurMD3L5P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742502114; c=relaxed/simple;
	bh=P5DePDaFaNYcmCmVtIiaeGKEzygWPc1oyekgDR1gbLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L2lzJJonRzx9g44R/k8S3gvxF/6/D0iQlg6r8y4lObMeql7c2JKlu7kSLXP84lGMbe3bWiYR/hv2ODoniN42PzIn1kSheK4TWsjmwcRWBPYSoB6MxpuFj3RrcCoqHMT6+CchMym+LtShgFvGWm7NCen+QAVJkUNK8hXHml4ZGwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jPxKrVSp; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-224104a9230so3300145ad.1;
        Thu, 20 Mar 2025 13:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742502112; x=1743106912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghMmqyEsNey8h9uPANFS5l6mT/T528d7V08nzimupro=;
        b=jPxKrVSp+sBlJcqpEqCVAgWETUJmKWRJLCOJ6DrA/rk0GMOp9++NK/c4/nc0W699MH
         WjlKxGz6uPE5xBWf24uSoDsqZQuNB8f6+bYlwaHxx93UoRs02n32zQ49prNnv6jgUjFq
         LlItuz9Q3eh4XiPYEUbjT6vwLCdUz1Ojfv31zJ+fMT9PMyN8gfwfZPx9bFsO6KVGHolW
         1mOu8WFT57KdxP21qB7AAo0+aAgFS1CizminA30UCZkm71JK8aYfpUpbp09GlTzt1A5i
         haRW0VW6+wJJYOR5DU6QPu/0YyMMUiK/W66qyTJIMX9zY9uU5MA/GT7n23m6GwPw1kxV
         1sBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742502112; x=1743106912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ghMmqyEsNey8h9uPANFS5l6mT/T528d7V08nzimupro=;
        b=jgrZUGxanVlqo49Mr0t8E4uEuISHaQy7u4yAC8f88eIzuFSGIUDOem0BO0Ujh5C5wJ
         QjlmudngK0/RBoGW3Ee4UfuG8pGLLJop805RNLcaGklzyuCNyXGx1gsQmKygHhTWJK8V
         I2TEpc1pCmHfqX9hpG2bNzC1LN/UDLxVoGIaqg3Z6ZkYL7H4HMEDOnMsEgSAXJPiQNYp
         WuD3NDAkWlY9vICRkKcY6eAQjN5U1Cay1vk2gE6Tp58rqndKIXdTNJaZEqR3gK8fVKCY
         Gq0MIFie1PCPwvBgKIhYpR6XgxVrf5V0j53wV1uKrsGNOudc9aMg5fD0nepKoSi1p5wB
         Bd5A==
X-Forwarded-Encrypted: i=1; AJvYcCU+Vq1wVz8ddW3hx6KbmlvROOojRfX2Wdo2vp1IH1Ir0A0D7By3FnN+WXVJgOlGmKHAQZL9RxL1oS0BibU=@vger.kernel.org, AJvYcCU9ZeOiAhgIRr/b8B2nYkfwpiM8VjoLUX0mKBRWLB9wsUs4xy5NIepSSdphGZnpqkcLfL4mlc7Ahk3bjdjy@vger.kernel.org, AJvYcCWiEenKqQ3lfCEz1355Zo73eCxhPEykKCv+N2W5unmuypZjRJw47Zd11P4nRnUbBhUNTT8KNlrkmRrIK4amG7Q=@vger.kernel.org, AJvYcCWvD/LYYgpeSY/SV2muNC8o4Ei6uDJ6DK+0vfIru0sjhvoJdCFz0BSF6h3RMnKzm2nKWu/AMZR5+KgXQOoZEA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpiafL71QE03KXqEtpKC0Px5Ku6Llo5l2AcTdsaiaj2ifGD1Wv
	pUJszoINH8uJ7cubg+h+0gE7FIOHvL8ObEu2lo1lcErj1OCCF+Mlmfb4o+GGXmgpNNKRZLK7g/0
	FLqlI75t/xK9EXTYkwYW4QcF+80o=
X-Gm-Gg: ASbGnct76GM6fNDGazqgxR/ghNCI0t3ritOAqpeVYisBI7XN7/8E4/ZKkZKdBVSxKbv
	FbNIo/FQ1du6vG/ozyLwnUxGEoYqNq+4C452chT3Xx/S8npdyElanZNucm0YT5kfeohDkOOXiJ0
	nXoJ1OROoznwYaa1Y9+Ehk11bofw==
X-Google-Smtp-Source: AGHT+IFHJmgf4jBxMNmrXn7Ub5lSsoBMIS5NnJWFQIb2lG7JavHQT1RlOCL48M2GyUh556YEEQBRazGNSLi5NEg8GeA=
X-Received: by 2002:a17:902:dad0:b0:223:f9a4:dc25 with SMTP id
 d9443c01a7336-22780e359acmr4042725ad.14.1742502112120; Thu, 20 Mar 2025
 13:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org> <20250227-module-params-v3-v8-5-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-5-ceeee85d9347@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 20 Mar 2025 21:21:39 +0100
X-Gm-Features: AQ5f1Jo4O5s2MBqh_XLGvRCYvhod2ITUxJyYm57Tsmfb5Nvy__-4KyEcsCyexBo
Message-ID: <CANiq72kGzB2CdGMcaftfg2eYvu_rBtH2_gxqVt7KE7RQxCgz8Q@mail.gmail.com>
Subject: Re: [PATCH v8 5/7] rust: str: add radix prefixed integer parsing functions
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Luis Chamberlain <mcgrof@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 3:39=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> +                    // SAFETY: We checked that `val` will fit in `Self` =
above.
> +                    let val: Self =3D unsafe { val.try_into().unwrap_unc=
hecked() };

This is wrong -- `val` can be the maximum, and thus it does not fit
since it is 2's complement, even if later the complement would.

In fact, it is caught by the doctest when run with debug assertions enabled=
:

   /// assert_eq!(Ok(-128), i8::from_str(b_str!("-128")));

We try to put 128 into `i8`, which of course does not work...

Cheers,
Miguel

