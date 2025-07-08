Return-Path: <linux-kbuild+bounces-7927-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB69AFC676
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 11:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 926BF1883B08
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Jul 2025 09:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67ECF1E231E;
	Tue,  8 Jul 2025 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="irObi1ko"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE892BF018
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Jul 2025 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751965248; cv=none; b=dIyA6lAhTdGEYZ2PUnJzUrw3++fmEr9rsWuSaThquwsVW1BsB6ulGLd/uV5XATIm//VxlqEWR+1jZZ7x5ywjPz8sQK6xB7AjOuICJwkUOYQ4MfwZ8NDH03hsgPkKb4XTjLZIdzNh5z/CWpKFwZHKN/3XOWGEa6tVnhdCl/MtGEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751965248; c=relaxed/simple;
	bh=oKiHS2QwaWhx4aHXHXDOqQrhGwenflpYapHEQjYl9NI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bZ8LoVWgj5qKSTzR/aRT6x4KojldqxmidcW1mj4Z79m1/FF7EkAnGba3lnEkjDV6BpvbOcTmZXNL8CYOzvMQG8TBpag0o+5NvEzi+KkKDJQPysxQtq2G7W9VRRrVSWRip2C2rlwExq3FqChozwMH2jnmYE58cGEI9qMUOWdcme4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=irObi1ko; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so3081772f8f.3
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Jul 2025 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751965244; x=1752570044; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1fAlswa67s9tCEEp5OLnodGYtTI7dff1nxXHYTx812U=;
        b=irObi1koOLDkSZ4jcN9mICNB4qKVOPwkVu00zqfb87nDAYry+UqFfX9kumFcLSWTEj
         Vtqp6OGZTfmEijsmOcjM6GKlobVW1/2n53hzM+YtJXU9InZUdYcAVPBPjNemWsbTKSTd
         qh9VxhuZVVVwkjgzgXXcyo+ef1/Db0qiXRb7SnC2abR3lf7MYRHSdD/XSG9YPP9kxdyM
         VYEVOkhC6T/0HHbBG5lsUsyGjnqFyMqgKMYJjMhKShnkfX/cLKWMM06it5URmuJrpCYq
         zWP30X5RRWpIFya3M62C2oBUcsBly5wuHh2kMMsbdoro12E/kH1G9APBmdVWBghbCLqX
         QXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751965244; x=1752570044;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1fAlswa67s9tCEEp5OLnodGYtTI7dff1nxXHYTx812U=;
        b=SiYf5Pg38s9pdmRYPZgsDONLuPFBQ3XsiuMNPzTHqwKrXhCmfoLtzT2LkTNqtlhHzB
         K7QJnBj5upoIje6mvMeYibgnGVb6wjdChfqamcHvru8DoPD97z0edC5cMW/D5shxLnSz
         xJPgSzoY/D5N53O0feQniD6XOksRzeAS4V+z8hUco/6w9VehCUCnUVwRai1tWg+eDpsy
         nCzGouxbGlBLKeGJ9xY5QrMP/3XvNsCAdX3b0k5pOu5RFg6NF2wqU3Lu8EyvVZ4NiyEh
         4XJyjqnhXABCMouJpqen4xXZrGw5x2I2j71lpmXWvmINF9sITMaMZrybsR7rRlDXtoP7
         e/Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVE2E7Us4q3yF3yV+I5LQO3WssKCG0BehZKBZ4sgdfOWplhxwSGmqkLAgk1PRVEHxEnh0zMdSlnGiHx+8o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwZ1rPBKIk5wxU1XerZCYz3An17fn6L/zwVWLb6a3LK2lVXmaT
	EnxEiv3vi3Qq+2GlpqC4tVFPMI+qmeKa9YluoeGdOBTULH25iITC/O6xis56UvL6QHvsL3IW5dK
	Ft7YpulSb6JRA7r8dwavDNzi42gz+6ugJrGfBp7hX
X-Gm-Gg: ASbGncuUJkJA7ilSgn7UmaQw25zkz3xKHdSkNdA5+r08Dsc2sm67WtyLnShOajaFs9p
	/Q+jIY/WrRJTDXtxV6o/XQvOPZ3cH3qJh+0Nu/dJ711gv43wHFNGpveg5bwjVgsgm1HPaGYMDUW
	kjV7Ow/vf1IPoAr8prMW2Z3lHP91M9at5HmTHRijOPfCI6wfoR8CIYO9hugAKe3Y2/0/K26xxP
X-Google-Smtp-Source: AGHT+IH5ZMoI2SoH4Y+a/fAF+bc85q9nK8PHUbdQ9aUoJUXw0mepkCi34+aNRnk2VfCKiIbsEaGEwLKTb04V6G/hB4I=
X-Received: by 2002:adf:e185:0:b0:3a6:e1bb:a083 with SMTP id
 ffacd0b85a97d-3b49701ca8dmr12897112f8f.25.1751965242575; Tue, 08 Jul 2025
 02:00:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-module-params-v3-v15-0-c1f4269a57b9@kernel.org>
 <20250707-module-params-v3-v15-1-c1f4269a57b9@kernel.org> <miAy8nyEfpbNOEEKc8GGbUJCVpgjOlfffFKuSdwzwiFTR_Q-U3oUWKShLk_Qed5HHKwUEK-f_UA6nJbhrubQdw==@protonmail.internalid>
 <CAH5fLgiKo=jN_V5cAe_AJqxxp7mQWqhKx7knkEj6js3yiU9sqA@mail.gmail.com> <87cyaboypx.fsf@kernel.org>
In-Reply-To: <87cyaboypx.fsf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Jul 2025 11:00:30 +0200
X-Gm-Features: Ac12FXyPWMUr7E_ukuI-GyjKR418XEws8Yf2arU_DB6yQ4eyibRsSxTLgENy7jE
Message-ID: <CAH5fLgj6mfkvnOCO=EQSz9pyN5OFRF3z3yGfyZHkLzqxjsPJ7A@mail.gmail.com>
Subject: Re: [PATCH v15 1/7] rust: sync: add `SetOnce`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Trevor Gross <tmgross@umich.edu>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
	Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 8, 2025 at 10:48=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Jul 7, 2025 at 3:32=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Introduce the `SetOnce` type, a container that can only be written onc=
e.
> >> The container uses an internal atomic to synchronize writes to the int=
ernal
> >> value.
> >>
> >> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> >
> > LGTM:
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> >
> >> +impl<T> Drop for SetOnce<T> {
> >> +    fn drop(&mut self) {
> >> +        if self.init.load(Acquire) =3D=3D 2 {
> >> +            // SAFETY: By the type invariants of `Self`, `self.init =
=3D=3D 2` means that `self.value`
> >> +            // contains a valid value. We have exclusive access, as w=
e hold a `mut` reference to
> >> +            // `self`.
> >> +            unsafe { drop_in_place(self.value.get()) };
> >
> > This load does not need to be Acquire. It can be a Relaxed load or
> > even an unsynchronized one since the access is exclusive.
>
> Right, that is actually very cool. My rationale was that if a reference
> has been shared to another thread of execution, we would need to
> synchronize here to see a possible initialization from that other
> thread. But I guess it is impossible to end the lifetime of a reference
> without doing a synchronization somewhere else.

Yup, a mutable reference generally implies synchronization.

Alice

