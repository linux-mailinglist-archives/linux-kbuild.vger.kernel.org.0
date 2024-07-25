Return-Path: <linux-kbuild+bounces-2665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B24C93C8E2
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 21:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA8471C20D5A
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 19:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E251955898;
	Thu, 25 Jul 2024 19:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="eL6p79dk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ED02E3E8
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721936679; cv=none; b=RmdRz85k2NiztJZqoWw2r0IdGh/zhPe+CZSzZaUC3ASVlgFhT8GZns+6HuEpjmsNVCkGrCxCgzkoHL8TnZyYYLsnaAf4xQO/iXilCgErYL1EN/gtKbgEKe5uolHYbD9anE+I5jXGiw2+cccKnN0uyX0wuPDZ9/plXnNg5aJCy8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721936679; c=relaxed/simple;
	bh=aBqBls9wVV0blKbvPQzDI5DoagTO6aoeGuyhrOnXOOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AtNv2c4w0dC9QmuOUvqKjaW7XjmjVhF65Ja0xTXhCWVyFkxDVGpNXuwFzP7uZbs+WPP2uaaD8fgZgWO8sv3S+hfakbl/dO8snBJhu2c1UqiNel/3FKOCdrdqxCg+Rc3nnVJnlGaWuUZ10GNrjDdBBp/pgW1a8Beszmu16PJQpck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=eL6p79dk; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-824ae03efbfso243454241.3
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721936677; x=1722541477; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q4iUXopDP6Wh0plwE1SwD0Ncn0XN49Aez3fic2VDamk=;
        b=eL6p79dkGS4oNdnj+W7SWTYnXx2HnR3v+MtM5sLfbmsk6x0JTn3ue2B8oEo90t+wbe
         sEtZTfrzrU34Khx6doG4TEPGjFC0vq9d3QE44yMI7KdG8tmWvBpwxgnZTDpZBsZ8Vzad
         WfR7NKjI6h8dVaMo9qRYO9WgiNeGKb+UXAgYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721936677; x=1722541477;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4iUXopDP6Wh0plwE1SwD0Ncn0XN49Aez3fic2VDamk=;
        b=JMz7yQqm9TnBCW8iqvZz4civb464ripSlu58/BcHV1HSA8hx6Ixpc4xSYc52ZPLuYY
         flFoS9RJ5+min7W13HkXBCyZsWqVNWvfn/WFS238JXNDb5Ul6YUMdfkJLUZS3i1G2bxm
         z9e8bA5Rcx5+4L1N5pRLY3db6nJJa227O58QBL6Lq4siLK5hD/Uqh3g/Sl+9F796qa1n
         dWV8irl87MME1aZkXpOG1O++epArKP5ytNs2aG+hS1UmnxGeWaFfXcSerdeJd2D5x39+
         vyKnQaTi19x9EFEPyfAJ1SddLEmZCylMQzrj4H4NcQKd0olsaYOVSirmHqiFrO/O7ZPU
         gZoA==
X-Gm-Message-State: AOJu0Yy+BhfZLsTlkby2hSBMIk0txREWHW1pYME9rAIXdOet8oJZm0uu
	CrEGRLBzCxeJuCpMNh/xD406PZ3ug+wD/ryeKQD7hauvHttpB11TspLeKLeyzcgcCS9Ho3ul/oB
	S8XY=
X-Google-Smtp-Source: AGHT+IEKQJqca5mWN0GkftNRWUvZOS2ELWA5AuuXeoh3u15q14onG4oJ8K7F+t8kkRqB3U2aCqutXw==
X-Received: by 2002:a05:6102:3ca5:b0:492:ac05:50e0 with SMTP id ada2fe7eead31-493d9b829bfmr4421910137.26.1721936676992;
        Thu, 25 Jul 2024 12:44:36 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-831b2709573sm277511241.38.2024.07.25.12.44.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 12:44:36 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-49291b02e20so406951137.2
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 12:44:36 -0700 (PDT)
X-Received: by 2002:a05:6102:292c:b0:493:dee7:9b8e with SMTP id
 ada2fe7eead31-493dee79daamr2651186137.7.1721936676300; Thu, 25 Jul 2024
 12:44:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
 <CAHk-=wiF3yeWehcvqY-4X7WNb8n4yw_5t0H1CpEpKi7JMjaMfw@mail.gmail.com> <CAK7LNARi5S0u3DD6fhtm8KTT-Cmd5xyaYsOsM+FmT69mOcdfwQ@mail.gmail.com>
In-Reply-To: <CAK7LNARi5S0u3DD6fhtm8KTT-Cmd5xyaYsOsM+FmT69mOcdfwQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 25 Jul 2024 12:44:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgcLs_7SW14k6O2dM6F_C_KYgrgvL6yHW6w=H-a+o1Hcw@mail.gmail.com>
Message-ID: <CAHk-=wgcLs_7SW14k6O2dM6F_C_KYgrgvL6yHW6w=H-a+o1Hcw@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.11-rc1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jul 2024 at 12:30, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I deduplicated the code in a slightly different way.

Thanks, looks fine (from just a quick look at the patch),

           Linus

