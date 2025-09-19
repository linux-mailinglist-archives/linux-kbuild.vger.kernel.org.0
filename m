Return-Path: <linux-kbuild+bounces-8911-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDAB88192
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Sep 2025 09:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB43D567C85
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Sep 2025 07:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF822C15A8;
	Fri, 19 Sep 2025 07:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hCKo2pF/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FD02C0F90
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Sep 2025 07:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758265567; cv=none; b=iLX+xFHZ9bPCazniL7DP7YEzWBbTSCjulAXbkR0lk/cl4UP7cukRITUKgp3USkDaWwARTqAPFJs2s1y1Xrzjj2r/+8d2X/QXXiyJqCpGAoCC2JaeQlASek/TdANA8kh3PvB7QQGkXpmqg8V64FJylxsbze+sGgc36CYgBG8C5x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758265567; c=relaxed/simple;
	bh=ItZKaGQl9It/js9gzPNXCsAEXczA+CYbzua9BHh+ovk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFxppYKBVuaqrFjNOM1Z/tfl49iSEwJY31yTktCq56jdEuwpi/pwfViLuPEwbl+z0yvrM3beBTYQZf9kImjl3UvURSI/mK65HtF/4AzAr+nw2e8UuhEyvfJXUAmxBAIdx2rTu116JZ5nYHVAZVLxG93hPd9Iwo8wtttM3AenUEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hCKo2pF/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee12332f3dso1432893f8f.2
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Sep 2025 00:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758265564; x=1758870364; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Klo+L3KBBL4ssbFZ2YOqJt7BcxJ8M+dYCfYzeUYYBY=;
        b=hCKo2pF/F78auKEP48toZ9iiNufcpa9c36bPf4P6fwtH1zaEBgaQ/RUiLIQk92rhWc
         B1LgQpeOqlgQlCfm8iif2jUa154KDKMvYQlSys5NZtt+K1jFjuxbzMGsfZi6gawxzMjn
         PH1A3hFkQbnoa61/vfXUDV3CSh6jvceVmBuMfBRP49NRPxq7AcTmj8PJJt5FMoY07PFM
         f45k7CojLt6eIQlQbuDN/fIh6vTw8m23VBVFZPh7tGbrilgmVh+/LguX/Dq/QoxcwGQt
         4CRU8KcVWlbcPIAhwDzT0GR2qRk3ORkC5h6ualYsffvKdotgOB88M7c91H+ryPIHp9Um
         Nvcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758265564; x=1758870364;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Klo+L3KBBL4ssbFZ2YOqJt7BcxJ8M+dYCfYzeUYYBY=;
        b=AZbTcM4iK+QeLyPIe4LioI8P7B50jltkMvoNHs8ca5nEWrBwDU//NqGUNYwixKk/4a
         1ixt7cPQU6lctBDZCSiPvxMGSqfUsB80zL9pzye2CUuavAeQEVJIABUG9TLuhtVpicHj
         2nawd65yQkN0cRA94Nt03t/zVMY0Uu8QBLsCpe2GjzsGvG1mcuh/FsNbR8pDdVOqpUHk
         9w1j0nAxTLFRzGT66r20GgekZJ50bsLLSTKIInbrIg3k8bQXPD/brKoVF0auBzISh+xJ
         MUF9ZHlrMLIWTW6AVMhpuLzYqMllDsrlhSja4CV3R1tvodfWAwF1zwui9HyjkZDEmW3P
         ggTw==
X-Forwarded-Encrypted: i=1; AJvYcCW4iEPKsqZQrdJh6oBCBI09BpO4BXtO2lefYd1yKsgzDPQIcEqLXmMlp9mDEQut5aMRDeBTXMLBPsRYidQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkoU0/VamyC6DhE0BXAN+gQxoEjdFelc2v3ZkKzjzJRsJ+iDPT
	UJSTXE4rG78fNZFTF8IgS0FPZLkvMzdVAfUFKtbgj+VOl5nos5yjFWeI9qIyyIlnXw==
X-Gm-Gg: ASbGncsJH7n6rLCPBHs5SbU8htJq1EZ6DegeeHwpmuM4fBocBvrs368ng9V1jOMf3FL
	V6CKU6JMgHs8Remy5vvofJiHfbAbdVyK2OqJXO3szXgSbTgjeQ+Nw55RbrV7xAZJSCryE4+Zsqb
	h/4CY8oPyd6KPTQ9QD+ADrAfYzeDfReRFtr1T5HJXBEVq5CUCZijal/6A7ki05h99cJpQ9BkX0y
	s1gaCzBbGS5FuwW8hhSDHtjjKTZFZVhKvZT8QlLj3UhxDjqjX1WqXrsKmdOslwKK2SrSpCt2Imk
	P8951Rphj7LYxeN6WhobSIquMuzyptHU0xCAc0JU16NkCzlh33vg9jjZ9wY1oQh8yLLPlNbNGmL
	ZfKhCObA+X5tVo2TRA3yT4JRPB4wYISwM8sA2u6Ulp2+ucV2ywGYxiT81xe8=
X-Google-Smtp-Source: AGHT+IHPi1pgPaxjy0qFYAQQyA+9c6RpQAFZf3vA/UzVRkHTrs+JR5MqjC9zARfGu5kWXbLyHGkoeg==
X-Received: by 2002:a05:6000:2c0b:b0:3ea:6680:8fcd with SMTP id ffacd0b85a97d-3ee7c925245mr1570227f8f.13.1758265563176;
        Fri, 19 Sep 2025 00:06:03 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:2834:9:1f7a:8520:7568:dac6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf1d35sm7200088f8f.55.2025.09.19.00.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 00:06:02 -0700 (PDT)
Date: Fri, 19 Sep 2025 09:05:54 +0200
From: Marco Elver <elver@google.com>
To: syzbot ci <syzbot+ciac51bb7578ba7c59@syzkaller.appspotmail.com>
Cc: arnd@arndb.de, boqun.feng@gmail.com, bvanassche@acm.org, corbet@lwn.net,
	davem@davemloft.net, dvyukov@google.com, edumazet@google.com,
	frederic@kernel.org, glider@google.com, gregkh@linuxfoundation.org,
	hch@lst.de, herbert@gondor.apana.org.au, irogers@google.com,
	jannh@google.com, joelagnelf@nvidia.com, josh@joshtriplett.org,
	justinstitt@google.com, kasan-dev@googlegroups.com, kees@kernel.org,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, llvm@lists.linux.dev,
	longman@redhat.com, luc.vanoostenryck@gmail.com,
	lukas.bulwahn@gmail.com, mark.rutland@arm.com,
	mathieu.desnoyers@efficios.com, mingo@kernel.org, mingo@redhat.com,
	morbo@google.com, nathan@kernel.org, neeraj.upadhyay@kernel.org,
	nick.desaulniers@gmail.com, ojeda@kernel.org, paulmck@kernel.org,
	penguin-kernel@i-love.sakura.ne.jp, peterz@infradead.org,
	rcu@vger.kernel.org, rostedt@goodmis.org, takedakn@nttdata.co.jp,
	tglx@linutronix.de, tgraf@suug.ch, urezki@gmail.com,
	will@kernel.org, syzbot@lists.linux.dev,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot ci] Re: Compiler-Based Capability- and Locking-Analysis
Message-ID: <aM0A0p4-3lwLeAWF@elver.google.com>
References: <20250918140451.1289454-1-elver@google.com>
 <68cc6067.a00a0220.37dadf.0003.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68cc6067.a00a0220.37dadf.0003.GAE@google.com>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Thu, Sep 18, 2025 at 12:41PM -0700, syzbot ci wrote:
> syzbot ci has tested the following series
> 
> [v3] Compiler-Based Capability- and Locking-Analysis
[...]
> and found the following issue:
> general protection fault in validate_page_before_insert
> 
> Full report is available here:
> https://ci.syzbot.org/series/81182522-74c0-4494-bcf8-976133df7dc7
> 
> ***
> 
> general protection fault in validate_page_before_insert

Thanks, syzbot ci!

I messed up the type when moving kcov->area access inside the critical
section. This is the fix:


    fixup! kcov: Enable capability analysis

diff --git a/kernel/kcov.c b/kernel/kcov.c
index 1897c8ca6209..e81e3c0d01c6 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -497,7 +497,7 @@ static int kcov_mmap(struct file *filep, struct vm_area_struct *vma)
 	unsigned long size, off;
 	struct page *page;
 	unsigned long flags;
-	unsigned long *area;
+	void *area;
 
 	spin_lock_irqsave(&kcov->lock, flags);
 	size = kcov->size * sizeof(unsigned long);

