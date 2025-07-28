Return-Path: <linux-kbuild+bounces-8221-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47882B1343C
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 07:39:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 662B5176D4C
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Jul 2025 05:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E309220F33;
	Mon, 28 Jul 2025 05:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9uS2TTt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B108A220F3E;
	Mon, 28 Jul 2025 05:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753681184; cv=none; b=JuT6F84rPIvWlEvw2mz9SG/pl8rGjZwgkWRkYMr9NWBkQ7sjT8PoB4XWqD4+mPAXxm4F8j6LcZrHYUhoVHRFupWokotI5FTtuzO6pOQixVu+1FXH4HFx6ba/leZfND4Mtpx/4rFJkhUd5rVQVZlSO/sZPskVZ/HLCba6hLe8/is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753681184; c=relaxed/simple;
	bh=X2bxsZlx5MDp5rTn5Ctwe1YI0HsO/qA41QXsv818O5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qMtlq9TSvJXVHbKahuV2KboPXOD9kuZnbohW3HXeBHJ1ebRyLws4FCecDk2VMp/iKGjut7XC7hAdamGOgukW01baTE9uK4IlXm3Isa1wg6Iwqk/p2uyNKxyMBEiftPu7ZtcjzDDLhSBpoUzxO9XEIvDPBtUkwn9WvsZ+2jZWuko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9uS2TTt; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-61591e51092so2061432eaf.0;
        Sun, 27 Jul 2025 22:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753681181; x=1754285981; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gaFBcY6PhjoQyS7AKQsTykSazBAoA4FN2Ql58j0Zd1k=;
        b=U9uS2TTtPGCdxkcS8YrQRW2IVg8y/Ehw6lONJJSuVVTyTVqEHH7sdF8IWm4RBRjhdG
         zUpNjDEzteiQ+dqJPm/AeAwwuSEqKYE7GypW0K9GkM6XzgTE4G4ZkvXnsnk//yuR3YKn
         oBWyz0kg9R0lg8oPQY0AH3AGSXOkPeU86tTlEgjXA167EfB7K5cmkEPUwRbzFAu8YxJM
         q0u8KXQ8lGCfjKwGAZ0C8e5atQ4NDGz65xnvPP6StRkcy7IyrkRRIhsfVXAEfKju+Mwu
         /WiFnaE6NGc7t3E8xHK9pcNOXyWVvbcob0z9O/DKxIyr99gs/TY/U3PQO1eBm/E2FTnj
         jLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753681181; x=1754285981;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gaFBcY6PhjoQyS7AKQsTykSazBAoA4FN2Ql58j0Zd1k=;
        b=HUn/bxO+kEWii8kOzwsFzvir/QD8mm+xLpaBOPixYY2si22hgOuHiI+3iyRG+cjJ+s
         hUY1LdZzaQ9YuzpcDDWoUaHZwNqIuwaX4DwQcSsk3KLnW11uNw+adBtFvK3Oxzv5cZl+
         1dYtHKWh+pxju7VW2ASgLUrfOY8uuSXjLttRw7douQb8LLJ7yyx2rCqJSw5ZyVKtAug7
         BaZPKHZScokLig+GnlOBU5KfWgIkvI3F0X2dIKi6q2ViGj2GIR8/JebESrmR0CTXfwIA
         55nHYvjTe7bJrjE/UZymyLkNARCFI+0Zb9GgtzfgIsBdhDFNPRKxoelhqGFt19mo9Zai
         B+HA==
X-Forwarded-Encrypted: i=1; AJvYcCW8Fyw+lNPJU2NsV/OoDPahQZ3C/MZrvUGMFRaHcRjwg/AXt4LeFaneCJzIRuFfMycXnrblwzNlsYJb6xo=@vger.kernel.org, AJvYcCXn3hjj6gbBfamJgvz2FiXNNDe0WFsgSJ6LQ5RuvsUmckt7pejp0r4iS0k7jso/bQfYmRS2JL9d267z1fb9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpjhdjxd6Z85iDeYA4xwQa+AhPSjCwJ9t1fhO2yMB5MEl4PhOt
	mbXS3WT6zyzpGzStVXMs06QlRHqQE8T7iZrmrryHGRjt9lHkfKlOFAw1jpXOb1sLx2jiKYe5KJY
	Fh5vOGl1VEJ/U2XgeZQILziEwJZrLdjKTKVQ3IS+fG4Ds
X-Gm-Gg: ASbGnctZK4jvcg51A+Jv9DdshjRYtEUxFk3YEcx8aV8IhAhAEiAJZddc7mo9bVNW100
	qALOIeexylOXRxgkRbqdL491JlPhvnMsASJ4YCwDwK16F874cGnh4/yW69Fn9hgdyV+l5jXUMas
	ePUh3FgsdJtHuNa28yAPCTK6t0CKxOXHxBneJ5O6L/UrMYRTGYzWPGu+1t0ESrlgNsqKbP7IcA4
	c7G3+Yk
X-Google-Smtp-Source: AGHT+IEOQZX1TnyqFEysH5JWrVs+NdZCp4hQ6hPN27tb8Q3DoxM2fDOyldoc2nyIYWXXmhSrzBUlcKuXUODEcA/HxX8=
X-Received: by 2002:a05:6870:f21f:b0:2ff:a399:c0fc with SMTP id
 586e51a60fabf-30701f50aa2mr7883563fac.5.1753681181671; Sun, 27 Jul 2025
 22:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250727164433.203775-1-suchitkarunakaran@gmail.com>
 <2025072842-require-smokeless-f98f@gregkh> <CAO9wTFjuSch0Cc0yXV=PR9vkk+66i_4PSanrPqKYyXXhWjO-QA@mail.gmail.com>
 <2025072809-pursuit-hardwired-d894@gregkh> <CAO9wTFi+atf1vwMrDJBa-X4W5UcQ8K80spgiGhMyhZj4aRJ3Zw@mail.gmail.com>
In-Reply-To: <CAO9wTFi+atf1vwMrDJBa-X4W5UcQ8K80spgiGhMyhZj4aRJ3Zw@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Mon, 28 Jul 2025 11:09:30 +0530
X-Gm-Features: Ac12FXwH01iH8tBLme1s9rlFzUYcbaVyzXI2-YL89UVDP9me8f7MB2yZF_f_AKE
Message-ID: <CAO9wTFi7ejkMbtT80EB2AAOQp7fi+GEf1eJWwfj4j6xU0iEhaQ@mail.gmail.com>
Subject: Re: [PATCH v3] kconfig/lxdialog: replace strcpy() with strncpy() in inputbox.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: masahiroy@kernel.org, nicolas.schier@linux.dev, 
	linux-kbuild@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Resending because I unknowingly disabled plain text mode. Sorry about that.

>
> Is strcpy() being deprecated in userspace?  I think it's a core part of
> the C language specification :)
>

My apologies. I was under the assumption that all folders within the
kernel repository adhered to the kernel coding guidelines, only to
realize that these guidelines primarily apply to kernel space code.
You're right, strcpy() isn't deprecated in userspace but as far as I
know some compilers emit warnings to replace it with other functions
since it's unsafe.

> Again, how can that buffer be "too large"?
>

Tbh I'm not sure. I was glancing through the code in mconf.c and there
were some calls to dialog_inputbox() with file names and a variable
length string being passed for the init argument. So, I thought there
might be some chance of overflowing.

