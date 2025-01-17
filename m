Return-Path: <linux-kbuild+bounces-5499-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 290CFA15466
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2025 17:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AF893A9D54
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2025 16:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DA3319DF4B;
	Fri, 17 Jan 2025 16:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="dZH88KyI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8996419D89D
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Jan 2025 16:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737131455; cv=none; b=eP8AOB1GpsJB/vFRe0wOlxjHsg+iA+josVTveUwhHayetZJd7cIWgy1c/FngaPP0ohTQxwM97kF7aDOIx2xdsz9ataak/0Rm97o4wGPYGmHxMRnA2NscsipBJENdShou1Nki7B4g5utXZqkGU+LZNPrdcqtZPfpHPhKheENgZGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737131455; c=relaxed/simple;
	bh=pbg8o5dz8njHgKg1NDQXRfGlM7MhqH+igmKnw4ydDHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MOfWp6SiW5HV7BNuTP6HnC35vYt6UcNIv5M1MKFFY1Om/17nLWduavmwOSW1xkWlxOsUPQksnBbipKHCaME2Q/TZZla2ijwvhNpH880YHJFPXbt4rOmzAcKwncVb6/rNyCu59F+JRTzYZlbCFXR2zzyqOtx16rRbsS2V2+D2aqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=dZH88KyI; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e5787c3fcf8so4204858276.1
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jan 2025 08:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1737131452; x=1737736252; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+X5++CJ0KNwoc8gGmPhsCoxz0UPerYMZjw+oDnzx48=;
        b=dZH88KyITmHWNjCuoOpI+++KNulowPOBbxriNYS8yQa0VmfvmxpI6Bk1MaegXGJyCq
         9WChzqObNmME8LFX9oea+V5ZnKuzoQnOBc2zMkmAcwURSZLB9yi+oDZUiOsnT07kfE95
         2tXV49gIO4cE7OVFvsIhjcSLUlR+AR2CNXRLLCPN4nFzvgNN4K0g7TAkmGJq8bVh/f4r
         vik+EImQkB8/Mg5UVcQKgwJ7Y/G6MbySzAFaxPZyBmlPdKLSfv9E88KKx+F16Ffqlq3Q
         fS6RUoyNHX7XnkCGoI47uzVmO8fhalXHAz4/ASaAKhLISNzc0Pr2YdHrB/v5hbjcOXnc
         G79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737131452; x=1737736252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+X5++CJ0KNwoc8gGmPhsCoxz0UPerYMZjw+oDnzx48=;
        b=GdsbD1Zpg0cACFSsDfkpIESde/xEn69mC4VZq7mnkwUnSkeUJr+ZlReuetdGLcOuNC
         3kz0AZpmBy6TEraaSWmiNUK7koj39Da1caFW1kHjTYP4FWfPQs8faxgN7wgxZa2bZkkB
         vqo8JKs+cLe8SMxdckLwjtwxddXdlWGR4lvl32R93vtMbtp6cVXy97qmtBSnBOaqiJuD
         Ba/FEHESqsGW2/NdKUu/pLuUTwql9Mm0iOiUPmYHVTOhxjvhHTLeEXheCDqFLCUQMlM1
         gRoRamhPbN4J7+IT3VsR8qyL/7KBkYzagLU8mXjaELYN/DZzFBf//9k5XXy+CJeY4QLk
         JjOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnNdy6xFAderaNY6921RokVcb3AdiTkew9xB392xXbcBkoVX45DBW44aAzG8nJAhJH5RQm+rfWWNmn1E8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZWSfexquB982+mKwdi9R2ZA0VskO2y8Y3EQjeRWSTWjkuCFu
	pc9YRRpfygv1DVAdhrV98zf6+5+XPL0QrPEFOSFaQgQsvaaGeaA/69ZmgSADUH9D8bwaebUkQ5K
	1kjZ9EzjbNN/w00efFtmjWmf2jOjpV7rNuyJv
X-Gm-Gg: ASbGncs6kIbv8jm9v68+dki4gdnLRsJMDPR5MqeZY2sRj9tT6BL8lUbkPfFwCSPEX+w
	jajFPDivCNJoq9wZfCddsy5kIT9AqUm9j5Zr6
X-Google-Smtp-Source: AGHT+IFkcIbSanU0awGz+g8PDvOcCR4f5DfDkcwb62fkJKTCQoTz3ErGkqkSlHrseL0Jsri6uzmQLKq+74Cm3j6IR/k=
X-Received: by 2002:a05:6902:1a4a:b0:e4a:3170:1e90 with SMTP id
 3f1490d57ef6-e57b1060abdmr2613329276.12.1737131452445; Fri, 17 Jan 2025
 08:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250108082855.PkG-_BaT@linutronix.de> <CA+zpnLc1PhF7zfWVCj3qezfvYYHbaOc-FyscWS9y74bXZw3rxQ@mail.gmail.com>
 <20250108104525.PJL0eRAG@linutronix.de> <d218ca3e-20af-47f5-b3b3-3a372c15a1aa@quicinc.com>
In-Reply-To: <d218ca3e-20af-47f5-b3b3-3a372c15a1aa@quicinc.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 17 Jan 2025 11:30:41 -0500
X-Gm-Features: AbW1kvYbcT7vva24VEusxajdJl_cPqcMxOHG9yj-PvcL5CPee3yPO304an5Hi30
Message-ID: <CAHC9VhRkVLeJVgU7kPhUnHp0r7rWRRYhs9NuLnsPs3cANrqHJg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IHNlbGludXg6IGVycm9yOiDigJhORVRMSU5LX1JPVVRFX1NPQ0tFVF9fTkxNU0c=?=
	=?UTF-8?B?4oCZIHVuZGVjbGFyZWQ=?=
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	selinux@vger.kernel.org, =?UTF-8?Q?Bram_Bonn=C3=A9?= <brambonne@google.com>, 
	Ondrej Mosnacek <omosnace@redhat.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 11:01=E2=80=AFAM Jeff Johnson <quic_jjohnson@quicin=
c.com> wrote:
>
> Is someone going to followup on the comments in selinux/Makefile
> about replacing the dependency rules?

As stated in the Makefile comments that you referenced, the suggested
fixes for the selinux Makefile require make v4.3 or greater and
unfortunately the kernel still supports make versions going back to
make v4.0.  Once that changes we can look at implementing the
suggestions in the selinux Makefile.

In the meantime, if someone wants to propose changes to the Makefile,
patches are welcome on the selinux mailing list.

--=20
paul-moore.com

