Return-Path: <linux-kbuild+bounces-8106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6473B0E33F
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 20:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 732411AA7948
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Jul 2025 18:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CE5228002B;
	Tue, 22 Jul 2025 18:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="AhbJPH6G"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2574827FD4A
	for <linux-kbuild@vger.kernel.org>; Tue, 22 Jul 2025 18:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753207961; cv=none; b=bbD8kHekGkC5zn1KL9rqvT80fKF8w1p2LCoyYOKIqD0Lpat0sAZ3o/GgfMHTcCuJYXlrt9MUWpbnPXYSOBVnEEy/sKLSsMlDCXKVWbvAahmHivbAKInWWeumWjQtWy7W6A0eDQwm84V8Oyec4zxLlpT0o7D2RdUi8POqU+IBVxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753207961; c=relaxed/simple;
	bh=67Pku3+c2NeuyySmqR1lN0RI6V6rpW8eqkqkN9fw/q0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tb4E2OvHJYXvY9yMgrG8+oTB9ADrdkvN5MeNWVjVCvhg+YsuX8FIK1DG0mAMX8wO6rkHc8NspRzwHDKVWM+w9h70OzltSJ8u3Mvs6h8aYPhEl7HmEVoL+hDVuqRV5Ozu8OONJ9UqavV6ysBEBQVwP9gVLfWErt95WB0pOTXxA2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=AhbJPH6G; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae0df6f5758so959083566b.0
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jul 2025 11:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753207955; x=1753812755; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VBGZFJ3kbjo9dI0n0oCeE0hpcWFl6M0zU4XdxWUvP+U=;
        b=AhbJPH6G2cIhtDNMlddEKewsvHEzxqrJ6dV0bIFvBsTKDamBdBBGrS9um5c8pblj9m
         94z8XUqsrELacsdNSycbFgIu9A4+C/qV+l3LC92pQvM6/LSzElcU9Xp1yrCAutJ/nZmV
         WBHg72EEkg/RmHNI/kjLMdfIupC+Jh/iHI4EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753207955; x=1753812755;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBGZFJ3kbjo9dI0n0oCeE0hpcWFl6M0zU4XdxWUvP+U=;
        b=s/aQIEDh1m1lT5oOJ4fbsQ4+94fQTH5ZKasdr85ySUBZKzuV9+ljxJl7Mg5eGxQ8Zk
         kkR9dKY+s38AMX0cqwflzeqp8RlIwBRDAqNGU9J/2DsRLJtwCLuCNydmQEgjZaiKkk0u
         LiQKLmnmDhWDzK40hecwHlrQ++2n+qjpTr2ZKxSM9b2osJ6/jEP6u4FreqzX8QKKsBVK
         PccAwy/fgHWYpmBiI7HTZsrOizpCoK/k1Y15UE0twzuJfsuaaXTyl7VQ50xH9NpXzWoN
         XNfA0eEqBFPuASQadiyLaWV906zyTKqKcg/5rF8Ybuk9m/5NsEM75EUsaCGRAYoPVCOp
         c6aA==
X-Forwarded-Encrypted: i=1; AJvYcCU/xVFwBdhC+fBuOxcQSDIP4zby/6PZl+8aWlEy4ZTjuoInvp7tcUauRVaq+C+cidqDDECLwLhVhPMzXrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqHkCpEAsgy1DjY442hYmZeMY5GJWnuTg6D95mRInzxMMIwath
	fvDryxlqsrYYmHblZfFKp1tbmXNb1vmXlqeQQX5IOhpmOnUN5DtQuXS0VvyHBE1B0Jj3rVEfGui
	h4sxE2rY=
X-Gm-Gg: ASbGncvErc8aRAjwB1X9zC21FSVcLBEFgTlE/D4w+0f0G9JtYokmvkRt2mfsnm90MKE
	NIPxArVQEC3QzEe0HSFApzYBsbdjnDbrC2Tk/rlvdDWkudUvvsUY36QAv19r+xrSGi0viGUGsdX
	PQ6uSOgI/H+m5YD2HlXD90LRHaUVU+I6sf/jkLrO8zy8JMGWrce7oNIqeeD8m/Qx4GNke0//dYW
	dtd5Qlu0POYhtE2vO7/RYATTcV9AMqfKMkrIAQsFlu62q/Vybah170xdp6+nqzADM9Hp9UgwdjW
	+vy31F3J9PMbj0HrDEOjQBGX8cAt0AaFUmyQUDu6DLySQMRKzaIXEU5LKh6Te2fVaVdHnimQ2hJ
	kfv6rwiikMVshEY9Gc0g4kxI3euzudVCxuApmpSlsb4DgbBVxuSVerUvLV1WOoa5Kzp5LraTU
X-Google-Smtp-Source: AGHT+IHOi9U49mdK3bQmtnZhWzyn9sxzvxuwu8ZHLW6KoLGiUysqw6EFE3WCScsGtHDzrpWrV/37lQ==
X-Received: by 2002:a17:907:2da7:b0:aec:f8bb:abeb with SMTP id a640c23a62f3a-aecf8bbaefemr1533339366b.42.1753207955267;
        Tue, 22 Jul 2025 11:12:35 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310ccsm906570366b.85.2025.07.22.11.12.35
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 11:12:35 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-608acb0a27fso9442997a12.0
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Jul 2025 11:12:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXAOremT/e/flyqy7vyhrOsDnpWmpeq7bhpTFCdkDebKib5dxSkGiWHwAl7GwnFO+JHlAEbH5Wwl9f/Z7Q=@vger.kernel.org
X-Received: by 2002:a17:906:ef09:b0:ae0:e123:605f with SMTP id
 a640c23a62f3a-ae9ce0a4611mr2382909766b.39.1753207954651; Tue, 22 Jul 2025
 11:12:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722152053.343028095@kernel.org> <20250722152157.664260747@kernel.org>
 <CAHk-=wihb6KVgU__zfhdHR=-Mqhp6qaAABdu31CJ2ML6MDj0dw@mail.gmail.com> <20250722130429.7418520b@batman.local.home>
In-Reply-To: <20250722130429.7418520b@batman.local.home>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 22 Jul 2025 11:12:17 -0700
X-Gmail-Original-Message-ID: <CAHk-=whgSradO-F6XGH+fRRoO3wwzWjZ_m7Z+m2aTVPxwPrsog@mail.gmail.com>
X-Gm-Features: Ac12FXw8Msp8bQOIa9FS5M3JcUkZEknhZa0tiohcg9UvPiSIpJJwczeZXsjNy8o
Message-ID: <CAHk-=whgSradO-F6XGH+fRRoO3wwzWjZ_m7Z+m2aTVPxwPrsog@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] tracepoints: Add verifier that makes sure all
 defined tracepoints are used
To: Steven Rostedt <rostedt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Jul 2025 at 10:04, Steven Rostedt <rostedt@kernel.org> wrote:
>
> I kept this to verify that the build time worked too, as the runtime
> check is so much simpler and easier to implement.

Honestly, do it for your 8own private verification.

Don't sent out the patch and expect anybody else to care.

The static verification may make sense. Adding code to the kernel just
to then do runtime verification does NOT.

This is not a "criticcal correctness" issue. This is a "help make
people not waste memory pointlessly by having tracepoints that aren't
used"

There is *NO* reason to add kernel code for this. Zero. Nada. None.

               Linus

