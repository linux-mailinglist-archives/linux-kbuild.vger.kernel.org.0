Return-Path: <linux-kbuild+bounces-9569-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBC0C4E440
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 14:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB8E94E4C44
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 13:59:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F5053590CD;
	Tue, 11 Nov 2025 13:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YZsUgUUo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84562357A22
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 13:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762869542; cv=none; b=FBcJh/kbLfH6qK6CYdFmstUx4Bgmw7wKLBZVX8f6RdPXi2BkAg9q7Y7yjLpOHDpfF+2E7ALvoZz0wkZOcVA9y8/cTm6CpguA4MPZg9ftvxsDt4rQgHpWQWSWVRzULlMkdp6REzVe3l45Nk9xtI8N05PbI93OJetQRjHiCUaVZaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762869542; c=relaxed/simple;
	bh=hRUmzVbCzzL89fOTZQBAaUfGAwTMnx1MK/93dcHh+is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfA7CG8ijWuDP4Hv9GZLVzFm6I+F7DuIIeYpHl5Mbv28qm1jFFHiobVWzFgDFThbCcDb7Wl54C/IrizlMEVOqVBlOwt9tE4YYTUqyT+i4EKo3jNhfDrMfWSAQxZFpHxszYeHy1enIIo72Lpl41vxiTVnIUDz0QX4Z2SAKOntZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YZsUgUUo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29800ac4ef3so4076215ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Nov 2025 05:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762869540; x=1763474340; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hRUmzVbCzzL89fOTZQBAaUfGAwTMnx1MK/93dcHh+is=;
        b=YZsUgUUoLezCFU0P/y4ACxySgN2oXPKkH5rAUf5K/Knu+yjMKYIEAtI7YWLE1CRREH
         G4CuuxoaTEockrL6hXAlWf0lY4nQRzzL80T1q7fmEJSsVau+53U9PGuFNWSL/5ALXvZ9
         gY4Gy8aWTsH+WCrDPGfy3++IOkelaCvSmWKF5ReNu5O7A3o5fX0ZZx4+cq0XO63GN9qd
         bYV9JSbp9+UvllV9KKNUO+tyGt51I3QqMtssFeRcwbmHn5h+RNSgJkV/O2Rnzmtfj4zK
         CVY9Huk2VfkwFwl9kJtqYxHo8j5N51q9r4sCHWCJUmcuSGkPkMEVb2wS/9+OgyV+2kBx
         vg9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762869540; x=1763474340;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hRUmzVbCzzL89fOTZQBAaUfGAwTMnx1MK/93dcHh+is=;
        b=uEYIBxYxM06uZnGjCrzY8L3BlYvarGvDbW8/gJBlkdNS1kn/9IYZRJrURmoX0D14f4
         I6lbsM/SvJFCxazCB27eIN+jhrwOK2N6VB4j5RiKJdCzT33aolT4I0XlrNgd8SBFgv9l
         BKCrFuHYh5mrJiAra/qcL/1Qqxg5+zgVH2N00aBgabAOWxMRhfdMvJdIfEwi43urBclN
         pyo8C47xHSwfxO7txZvJ/EH+n3tbqzKKDd6kQ8cUW+/+BEA4W0aLQuiWeF3kiYXqn0OK
         kVNyAchR/UPYiNdRMUSX8Vg6sn2CViTTM0k9mU1VOfKhur5K+9N2SoGkQPHN+/zwcBkz
         ymEg==
X-Forwarded-Encrypted: i=1; AJvYcCUCp/i2NhgbDxko0oa7FASBy/bIDISe1Ja9SXElytcQBWXhF562sJ2oFy3MENyykjm+v/qZeYSjMLay/aA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc2I+meo8fSF17cF8zrBq6vLToRU8Zte7yPxamr9e01jqGoE9g
	Iyj9caUWiPAwWxbJ7R0cxnsSvLxwMimbuQGMB5shduZ5zI9EVjC1iFGeKYr/QCh87SqblSKNi9q
	z41yMwuefq7R9CD53r61nHuY01dCa4sM=
X-Gm-Gg: ASbGncsdSzrjNqWh9Sn9fvW7ZRUFcaQHCsFnqSBrrV85YbyE0R5AVD4obBB/DDbue/u
	sz5yXN3pB9LqlefK838ruiormwYLeHJ1eTNQWeCC/gKxtnZxOPpeT+AP8B9tAsEk9HkgvOwibi1
	53z1X3I/D2WqQ0x9auxF/ykT/sPCtcdkW4HgnJVdF0rSOM9X3ZgZig+VJZ2oV41dUGoBX1w3mi1
	XYZyZVMPkirN4d97aGX4mp44f3+MuKsYwzse1zNLOipckf1uMXeeMMTj4EjUlcPi6k0rnpOML1P
	bHnJ8aLTxgyO+2D7MMQVJldhaMwnWDKPHX7OcIJlKj2awbgFfjBKmBYowi/HZa4jYLD1GZlFRA2
	rZfaDyWSvTXe5dg==
X-Google-Smtp-Source: AGHT+IHYXxM/I5GaOybb6g1yecFYohV3zCOa1VEm8f2yGvBo9rJ8osfE6aj7FDf3tvSiEZ9Z9+sidUs9ZqMaIBw6rqE=
X-Received: by 2002:a17:902:d48f:b0:295:54cd:d2e2 with SMTP id
 d9443c01a7336-297e4d096a4mr91553105ad.0.1762869539841; Tue, 11 Nov 2025
 05:58:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110131913.1789896-1-ojeda@kernel.org> <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
In-Reply-To: <CANiq72mjFobjfQEtNvk9aA+757RkLpcfmCCEJAH69ZYsr67GdA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Nov 2025 14:58:47 +0100
X-Gm-Features: AWmQ_bmjChoTwnLfQhUmk8zTDZP6XuF3N7zYh0KKb3TDMGl3YRN3n87n4dAkPXU
Message-ID: <CANiq72kaoYYMq+ghFsa+YrRbTE13M2TrtOMwAK1eV1Sk9tEQzg@mail.gmail.com>
Subject: Re: [PATCH v2] gendwarfksyms: Skip files with no exports
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, stable@vger.kernel.org, 
	Haiyue Wang <haiyuewa@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 2:54=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> I will send a couple other fixes to Linus this week, so if nobody
> shouts, I will be picking this one.

Of course, if someone else (thanks Haiyue!) wants to give tag or two,
I can still pick those up, and that would be very welcome.

Cheers,
Miguel

