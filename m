Return-Path: <linux-kbuild+bounces-10658-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F6D39AFE
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 23:47:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FB343018F7F
	for <lists+linux-kbuild@lfdr.de>; Sun, 18 Jan 2026 22:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510A8280A52;
	Sun, 18 Jan 2026 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JcU1bc9y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2581C5D5E
	for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 22:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768776464; cv=pass; b=fCYnCADAijrw7luAaBw1IwxsLhrdzsEbcqGkMmkfBVNAD5RSSvyuy0qxDcck+PSrXKLtwCKbVTA1GVne5xnTh6qmUZgzEbqM64LR8TFumADSkOlI4tbKqg7jHWOg7IfYSRBfweK5vX0Eaf9oxuT0bUHiX24RsEvDFnxoWwhP1S0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768776464; c=relaxed/simple;
	bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Um2TvWX+pktAvjffRSvJZl762GDb8TKLE0JIc/vsQyaw3LPru3MKYHt/EFht712kWOr+ODbYiQmExRceO+VAp9Wo/yCSSrfhpOfHVtWvImfZ8HKY7yP5eEt1xgKlsgCNo8xDUs0InvazMuxQYbivuTDY3Ki7JBfCHUdjZawqX1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JcU1bc9y; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ac370cf8c0so298344eec.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Jan 2026 14:47:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768776462; cv=none;
        d=google.com; s=arc-20240605;
        b=WAplRZimU1nQHHyvl0S/5QmQnWF02GuQLooiVbfklOXjc9UJEubOwfK6tfSYqh0VgY
         s5P3v03OZOYxpB/CMeZxI0LimnawrFrcsn3RAXJ6oAAOpJmor1D6DELhKKyfZ6Hpif86
         Uh9hozaJbhoqfwUgbj2HvSHju/TTWEmhGEI17ct3gNwsoKkjt7w6NaRKXZyHsN5pelVi
         nb7l73ahpYV2tIZCVZSctcjS8tZ2DS06cOMVW1bf1an1N3JWtK8gX6SksBnfWI+lW8ed
         NwoIwfVxbC9kvypiSKMUIZT3Y4OSwtbvb/H+Da/N2XlG3KxQpBiQHmmu3DsU+GmOA5t8
         +cOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
        fh=25j1Xe0VrSft5cFfNA4y1e7TftWjpGccFOhcRQEQNfA=;
        b=FsqRNNg+9tN5hkJnCSW9wqKhm98CpQbz7SWWNtNQcWem9t88KIE9WWwh4hYjRpoVLi
         myha/SgAdqlsVRbRSSPyscM7twyASv24Lz0DN6IWbbk5r1xMKRRtVFoWtZd1Wn4sW6Bh
         3vG7lz8RQh1rixRxhYDmm2NuqTm81qiHBA2Pf+eWCiGg68WJ8izJT2BddgGNNLHDrWUq
         6cMnxPrIrXAK3jwH+YVdXDR/cZqgY+tVO3rrzaCFvfShDMq7paBERsAokADSMtICRqqi
         xsyI6zoTGeeRmnXHDn2/fHDO9IZtKNiJBfrftEGU9uhhDR77cStxN+loj6CArF2SG0NI
         4QUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768776462; x=1769381262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
        b=JcU1bc9yLzSAF9cw+PoTE81AfRM8da4lFwqQDFoCrw2XBK/zQOjcL4qo67uHdUq5sk
         /NjtTOYTRzFYZuovWkmvWjBZqF0Axh1/WL53w+stBRAMXjzCGQLI3espVlnMSIfXV2R0
         ER/NubyBJrQFf5oXDI6I65IJCtGv4r+2XBZYuskMf+sVL40uAUwjXaSu4s56z6bkFpoN
         Q66DP8PoRgYb2HjNbzxy2qNTX4VtMd0irqOhnnN3Flr5CyuA0E67LFMD2ed5j6MVZK6A
         0mCg1Hqx92KreKtrlQIFXxnf3eRQa0t4eG63Ol+GjA1pa8W30Ktag1YS7wwYd1n7Enfc
         RiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768776462; x=1769381262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZBpaIs1HHystnXkMKIEfn8j6ZfCRA6e9fwxUVVxwxeQ=;
        b=bdqWiUlvIYnoBZGHD4Vxr1OEPLwZcKat9AuB7McwI+s5M5p6TdxyFPMBVqp2ULrsVB
         8pb9mLG335kk3kXvLdHcgSx0ZiWB1V8Sv6sG4ORNwYrKRepiFedIdkVOXL+DGqtEPpfJ
         y6XlexvlzoatzB3UqTQH2nF3jaNajKz48corzBDnkrOLvZBBGsVNWRSfc7IlDDjFjlMJ
         SYM1XTlfGVsIW+JwhipdteLSlJuZ/24FS+fN6C/Wdp/BPfbOEG/65xQjOFWGphyoHa9N
         xMVKl/TMAxdQfnA0JZuRN6GGQBeDXlBoe6ZjL5rIFOudPEQYnQLxER6XOBi+YMweLaXI
         i9GQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1BKu/4gmalKRGj6mY507gglntj7uFZ/IyGym8cvhtWV8uq8WRam9Lr1Cs9FeGsJLQG0Z9xqbXQgxZ3tM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEC/Uv9nGTY7ZVTJj5q1TeSb8rXi5Ubqku932qH/zz75h00nA
	k9l5Uk1tWerrlX1HdiWJ+DxgafybI3mI39RpKrbu/aEo/Pn1FdeerGKgt8WweByVpokYAzlCrJr
	yOHidkdEu4a+Zr0cnBkHAN6y8M2stfmg=
X-Gm-Gg: AY/fxX4Dc9BwhtDmVK+rkSRFv52UHm7iIUftvgx43k5fJL68L1Y8l9KCTogitQen8ga
	8air6/dX37hJQMVRv0UBQNBEcB27j7pb/4sPAUabTrHp/wwyo+k7KNo91z72K+WfO419RxXFR9d
	uVXtoD/HZN44IprqkKAm5skJB6krd5q5Uq2EFr+h1gpYTgXwuk3rvhRKb9F5AOgQP7OhrXzPLT+
	xDaIRIOf0i+0d5y7DW4P3pCjJ4Ha/ZyLJD62/2C5Ub9HmJwm5vGNFvNrC5VfwrCOsH9IccYATDY
	9wNq3XGmgd+FqRBgHB9LkWda/VyWXuMpADUd5uWmyvJRk4/wTSwNhC0WgVIdEOFXdkebf83/7kb
	6cxVslyzARJU/
X-Received: by 2002:a05:7300:5712:b0:2ae:5dd5:c178 with SMTP id
 5a478bee46e88-2b6b3ef8367mr4547407eec.2.1768776462060; Sun, 18 Jan 2026
 14:47:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251221081659.1742800-1-stijn@linux-ipv6.be> <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
In-Reply-To: <CANiq72nqwqTmCzKb=rhRhUDg8pju_RB2zzCKnJ5hDrVTUVnhPA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 23:47:29 +0100
X-Gm-Features: AZwV_QimENAu73eyfoDTdWFMk-4fufF1OWMRqN4JWmKaT7_EDgF1MS6gjjBEJlk
Message-ID: <CANiq72kw1Fg3wGOfa7E4tOtf7Ko8BNCZffV+XVgQRqW4PoOfYA@mail.gmail.com>
Subject: Re: [PATCH] rust: bindgen: disable GCC latent entropy plugin
To: stijn@linux-ipv6.be, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Emese Revfy <re.emese@gmail.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 11:46=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> change the signature of the functions (and even for variables it just

And by "signature", I should have written "ABI".

Cheers,
Miguel

