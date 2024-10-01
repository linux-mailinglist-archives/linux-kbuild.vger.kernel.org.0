Return-Path: <linux-kbuild+bounces-3847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7985198B3E9
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 07:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB8591C2292C
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Oct 2024 05:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E7FD1B9B50;
	Tue,  1 Oct 2024 05:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1lxhyFx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB4ED1A4F2B;
	Tue,  1 Oct 2024 05:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727761908; cv=none; b=u7V/2ss4SSkwHu90rgYVNk162fsj6Oha/MYA+x0exyGHbJw9Oq7o8EVrAXngv8qIZrB+Lpc64jMWQMQWF3QsbtGcV+tDDNBA9hzGQIt7d7naSZT8TUtRFds4Y5pdf4tGWLz6Byr+w+LEx8LUIr1io+UR/XB+IhZ4G01yn5Fp2Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727761908; c=relaxed/simple;
	bh=3/wRht5chjIqgH1ON7u8+YBRhM3p+Px11yM4Lw3cLa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pHxcohCbi/ytSh2fWuVOZriG8iDjZwqlEKmUiSn55zMXo5vyZr6FkOK6+bE0VSPANprzNkkkjdL2sfLgfZ0fL+nKsX2hd9n9s7xXCmEVtKjHdx3XnS8i8bG7IkM3NBCYl+B3domTU9uOogqTQ5SUOBsg/Fp+Gxk2b/800MEaMKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1lxhyFx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7cd85502a34so215656a12.2;
        Mon, 30 Sep 2024 22:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727761906; x=1728366706; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/wRht5chjIqgH1ON7u8+YBRhM3p+Px11yM4Lw3cLa0=;
        b=E1lxhyFxPOVNOtj/kuH1htbMrnl1BPuXKwB19aBsxmErkBkW8kY6s67Sh4NViokIdP
         tmdFoNoTov9hP8E4AEFvvfZxc26WWxN3TG/HjquwuEe/49nKrA25QpmNmPXgva/rpmue
         cuO2QqvEQBNDEj24LMaWY0Quw4adAP2x/1gckJMg1eWheoyHCNSST3SLjWS9Ig39a3wb
         FIX5xPn8UdDNbGi0wiA8zBzkqPRvlyY5a4NB6BbhC57Fbr+fvWOmaof/fedyIALVBP6+
         9nQ56biryKQOiGI2/n9HoWt6M6Z4KqLcaaY8SbddX4O6XJ+3+05J/BV/739tLpFRqHpt
         BBrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727761906; x=1728366706;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3/wRht5chjIqgH1ON7u8+YBRhM3p+Px11yM4Lw3cLa0=;
        b=p5gXMu66xFjBa07o+CWm9PCExSjPOmDUPZVwHol5nSdISetmm1KeFJ8P3w5g9RJYGo
         sjmCWm9ejB7xWTMdcjKqLHsgpYZK3jeVFO52r36FB7cxANN9YfBZuvrsXwACp0zEQukC
         5rReCWP0wmaEt1khPTMTzzCj8taT9EJeVqjuN+5xNMSdF2EE9MavJ4RifHsCWueJDfPc
         QgFrp3on0yw6uuk2iPt0J6PX0dwet6e+fKZdqIJHa6qlPjcVIY6CjyLNOpG0UtHiVI7R
         2JujpHjjWTNirrzNB1NMlRZ722hv7mH0uFvzn4ZtPPjnIaoD4AIh8RyCsmpSuf8vH95F
         Ie6w==
X-Forwarded-Encrypted: i=1; AJvYcCVcevRX+IY1Ggww0niZwOerzrnR4Px/3kONq6M226VZ4KJBaoq5FUpxR+hNLCk46zDMXhzOgRAzjkYEvYg=@vger.kernel.org, AJvYcCWepX1A4rlxZdfIUPm4XMCZcjU0uv8XmL524FkrBkC+nzWqPz95XNDHDyOTthATOvagbu+HX/6M2ipEOmAU@vger.kernel.org, AJvYcCXt9+QaFD2xG1v8Oe20i2fmZuWEcagZ0U/7mf2p4bGxFx4U7kXYXGigdIrjqKmdrFvOmUBEfhJHyH0MIuQZ4fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6lczoVBfJArA+5h81sCqq9fRpLF5zEM+EntecXDbZtm5BBxi
	tuENDH9UqZqAeS0OVGNSWmbH61i7b+f5DExgk+h48RRL57TLS8JGct+aJeI6B96NaJ/q+fEZ00Q
	rF6CdGnKVTnBUgQEWhRed9U2yJpxUCc2w
X-Google-Smtp-Source: AGHT+IEIwfs2ae50IxJcrYEx+9x6jDhkTa4h8dXquDWIxEFs1VpueqZk22iLQZsgbP1/FJwllipH1R6cUki2Wf6ve+w=
X-Received: by 2002:a05:6a00:b85:b0:718:e49f:4185 with SMTP id
 d2e1a72fcca58-71c6371432cmr6551145b3a.7.1727761906110; Mon, 30 Sep 2024
 22:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>
In-Reply-To: <20240925-cfi-norm-kasan-fix-v1-1-0328985cdf33@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Oct 2024 07:51:34 +0200
Message-ID: <CANiq72kMHp=F8Vyu5t2nPk86FB=PwcaxZQKRs9Sdj8FrvpQv=A@mail.gmail.com>
Subject: Re: [PATCH] cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig
To: Alice Ryhl <aliceryhl@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Gatlin Newhouse <gatlin.newhouse@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, kernel test robot <oliver.sang@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 10:10=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> There is a bug in the LLVM implementation of KASAN and GCOV that makes
> these options incompatible with the CFI_ICALL_NORMALIZE_INTEGERS option.

Applied to `rust-fixes` -- thanks everyone!

Cheers,
Miguel

