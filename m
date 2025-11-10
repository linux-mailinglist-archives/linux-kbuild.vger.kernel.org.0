Return-Path: <linux-kbuild+bounces-9498-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C9991C46272
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 12:11:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5872E4EA2F2
	for <lists+linux-kbuild@lfdr.de>; Mon, 10 Nov 2025 11:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225DB307AD6;
	Mon, 10 Nov 2025 11:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UgLvWUIj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B34030B533
	for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762773016; cv=none; b=owPdAOU2T48gfUewd137IQrPZokD4LE79xN5+sGUU5X0DoklrDAvL+sMK0DfwxwTJRgrIVLl0PsrHuO9qvjPxviSLuo+HAaF17q+lWVhGTInvKVO5Cp41q7ucNPr5SAuxVM4P8nd8OCQN7nvbXTHhOGUriuGCAVL+24DPev5Dms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762773016; c=relaxed/simple;
	bh=qYod02zCx1H/VIglPSYtMCLBMHqDjGDF49aeweBgJ6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hB/rcGugA7Ue0sz/u+iMZItZOXeABoOF2buGN7qrCrk4OP2pEAgKCvrpuLZp+m/uqqVbOO0sAaoVWEdkpw4mSi7AieyxBrlaqlvUe5gg/XiC7AfE1RB+pECa0Hgp1aXPz0/89udIsHV9eR0bvLoeh5G5F7ekMGtd/qtJ3RICPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UgLvWUIj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b62e55af64aso230373a12.1
        for <linux-kbuild@vger.kernel.org>; Mon, 10 Nov 2025 03:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762773013; x=1763377813; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYod02zCx1H/VIglPSYtMCLBMHqDjGDF49aeweBgJ6E=;
        b=UgLvWUIjzQk8VSMa2U+laJQrFNGM4W5Hk1rmIuPuSrK9Vj9TwXmMbnzEjulN/PKW7K
         3dpURacGdJNl5DAwLfkz4/djY4g8etVYltVz8hyh6vOAgPSsdaqLnzHFQol7saPx9k/6
         p6JZsxUqUIXTz+oONrniSMuZhG7Z7nKfuwiq2vMrTQL3ts959pzMG1CK1cAfkNjcDaYS
         bNWUEMEOAORCWWZquUl7f5Z2k0DZef9fBQPnhSogNVoF1qVQIoHQcPjC2JzoYh0sy2NA
         hUmgcO0oajwid+mUrxJrmAgwDdNbDKk1Z46SWSNzL232B45WXDoZwFcS9uD0T5el90xE
         CyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762773013; x=1763377813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qYod02zCx1H/VIglPSYtMCLBMHqDjGDF49aeweBgJ6E=;
        b=fZr4DAlifLxeR1VyGhRzS7Rn+MzRF8VLHdF4kID/HL8/56uZoZ1mRlcz95KtalKpmO
         hw/iYTBw41k77kISlkq9cf0nR+9e5lLkQo/dmpeTzb8/9r24hsFI8zyfZuR5hAU0Op4J
         RcJ6KzogFvUv5Wa5Yoy29bbGVyAaXReEDx0sR1VPVwvhw1Mxn3cGBPNyVa1RNlIqyh5+
         kBZElr37aM4fRDtke3FdXOjSzT1olSUNiFIlfczaa+s3ATTu8irzMW6yM0Qqqg6PdqV3
         u5pukjU5xhVKK2LtBp1DpOrEyJd90D1FpuqYEZDwW2/W3L+qxd3LgbMXbDk6JxJQrIUn
         y/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUH/jhSJ/bjshvZA9+b4vzfe/Ja8FxRWgHgVu6Ir7BuFIM3dOg8Xl/zuO2opuzdPZrmHTZ18BzVWQaiP8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YygmkHZCIfCCYDy7/3bLenxk7GiOEi/tiDOwY+7k0V6tmAsgbpO
	4Yy4ydist69Pt4ak0+Mjs8y/TM4f5ElT+cJbFqjLRqFJa54LLuBdVHi2Chz68QcI4Ue5xBpvnIM
	4Kv8NOyfXfhsF/FOC+0NS7yLZgcUnkok=
X-Gm-Gg: ASbGncssvbvHsfF+p1SRCwi3+1Q0FSrdF3ZVTM/3S+gHUy49yOnT8PdfmzMonhs2t5W
	GuQ9nyju7oGymXTzP0IzNNbvSiUdNY8KC3za50Ljy8mKiUIUDyNxaOHN3IZNLEIZUicmzwVIjrq
	lwnOAVUM9Ig0/1z4oNyYuyMAsJDAIWFcpNjTNPsGTBAc/SdYCK2nu33gr4wfjyjYtvEhn8V+xDu
	40kvYezMUh60ISTgxAXxM+guDeOvPf0/VVtJrppCQdbTwLEWzAinbY3NlUc8ApF8ArnjE8frzSm
	Y1A8+GKCehOViVH6bsxZfsdKe1P1HIGC84MiN3Go0drRqhPaziOWj7ttn6GXfovXb08R/O3MVYo
	2WEKFT1WPIo7K8g==
X-Google-Smtp-Source: AGHT+IGVXq7fcQEVvIh5RJVo4EGz3TaqkWRnWgnqaRHyeXV2fhzl5cAwdSbAJFL3N5gLtGPGFbMfA/d7S7FryVq/+Z4=
X-Received: by 2002:a17:902:ecc6:b0:267:8b4f:df1f with SMTP id
 d9443c01a7336-297e561612amr56745215ad.1.1762773013490; Mon, 10 Nov 2025
 03:10:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110095025.1475896-1-ojeda@kernel.org> <20251110095025.1475896-2-ojeda@kernel.org>
 <aRG9VjsaCjsvAwUn@google.com>
In-Reply-To: <aRG9VjsaCjsvAwUn@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 10 Nov 2025 12:10:01 +0100
X-Gm-Features: AWmQ_bl715oPxt8H1J_mTcx-bHvv176_Uy8uXuVHipx3MICAaN0f0Hfn-QJfLWg
Message-ID: <CANiq72nQr8a2Qkt10rPGUgb6DciYQZCsLb-fg8S_ZV=0+Y+ZVg@mail.gmail.com>
Subject: Re: [PATCH 01/18] rust: condvar: avoid `pub` in example
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

On Mon, Nov 10, 2025 at 11:24=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> The unreachable_pub warning normally does not trigger for documentation
> tests since using `pub` in documentation tests is not wrong. So this
> sounds like a bug in our doc-test setup.

Yeah, we can allow the warning for doctests, that is easy.

In any case, this was needed for the future pin-init, not the current
one, so I should have probably removed it (we had a bigger branch with
the new pin-init).

Cheers,
Miguel

