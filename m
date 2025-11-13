Return-Path: <linux-kbuild+bounces-9616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8811CC57FDF
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Nov 2025 15:41:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BC163B3042
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Nov 2025 14:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ABBA2BEC43;
	Thu, 13 Nov 2025 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nEke/2FF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51AD2C1598
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Nov 2025 14:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763044248; cv=none; b=CW4xY9QxZr+DYQCUErjkn3dS7a1wlIv+Q0MS3Q/jokJFXsQxj9mdTodMqV3czsC3uRpnUeW5WjxwqQIKbLpBGLsztUP2BT+Ml+xrJVkaAN0rk0Lo9PqlapJFo2uhEcjsFEwgvM+u8Ff6l3IO/f2tf9oXoLArV5D4wVbdwrCrk2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763044248; c=relaxed/simple;
	bh=MBXryWsSo8WBJYsfFQQsezl+bvHfvcNsNG0PI/C7tiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k2DDfQB1eC8oRS9ZN3k7Xt1BM3CIfwcOqN4PvAd4SfxJNGsv5+ujKlF5Shx3Jz4cc37jfHZ+JC/iLR0PsuObkd9gztG/5tsiiFL3ArO23nF0P2INtuwmU4kYgBBhnsIULtTZuzyzGNzOVw6Djoa/snQFRNPG0ehlMJBNDFc8kTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nEke/2FF; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29516a36affso8532675ad.3
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Nov 2025 06:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763044245; x=1763649045; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MBXryWsSo8WBJYsfFQQsezl+bvHfvcNsNG0PI/C7tiU=;
        b=nEke/2FFZG1ng+mTf7XuFWr72uIT/zMOwz5Plept3fLottY4A7mR9yd0pdYTXPfV3L
         hK19/tFNKtBWt03/3aIrLuEFubAZ86OG8UKxWfMXZ/xwaPm0haeaSFvRKRZyqL68IFFr
         RUbfkpw/AxbmwRe4UBjcf4u0hY4RgCtAQU+DeP++bLkWGUge3WghXIIG2aYlBAHwJrwa
         qNbtn/U/W2g+PNsPotzSGxq1CDZ2ivBjEr/ylIi5pnAtig/o0c8DLddUOMVoTVfBVYw2
         2Wrg941g53UdcpQMWmmNwsTkD97k9PkGsnanMcPBhYlfeFftgOS6jQNCW+h68bt/aUbO
         AUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763044245; x=1763649045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBXryWsSo8WBJYsfFQQsezl+bvHfvcNsNG0PI/C7tiU=;
        b=RU2vvGE2AktWDX5B2ZUGS6m2E8Ac7wp7q35RywcSzkqvlI6Wjz3KZYs35eerQqT6Sy
         N83f1YDEM7b82V8TueQlP5Ka9+5OlbCOs6wp/L4zROkX5eTN/qTywvIbFVy8OnCnkhZ3
         CXtz1/HvbxrSMrdLlKU7WFeFstCoO1juuyZ8xTIL7k/R+E7Jl0mUv3qLT6LLlE/lsi+a
         42DJmr2YiNvkdnPzs1Ow6b4WsoBFqgf6Sbshf1QwTaeginlRY+Rm3YmG0R6Th2EwGrsO
         /6kGjbJiosrPhnKpMAv4HHZMeZkNsTdWwpJDcH47OgZGpPtJBMX3xrrk9Y7ZGGtpTQqE
         /Nyg==
X-Forwarded-Encrypted: i=1; AJvYcCW/sa3IQLxkcOL4hwwl6uzWiwSUgsFPkwe/4G/wYBjdGWLBhHBQZ7+q/K0SXSvNP+ERFzkVMQaRmiUbeCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvvmPA5z/Pk0BL00Jf5ejTBTCS0vOFCdAyjeZ3dmfR/Ehbje/p
	rndtxqgzOD0fAtqd1u8tQ4qU6/8wDcyjX7df5AvjPuMBPKNR3+UjRMhclgqDNyDb06ARqNIrfcJ
	3znkpU4XzqbVokAcKZ4pv/Kw0o92dGCql/Q/Jt8TG
X-Gm-Gg: ASbGncuG+AnFayGMMKBtuwMY08gezyySO08UnXhmSefp1Y6baYksL5WN+Vg7HIWbEq5
	D+gdlsvbjeahCcu04eqDIhdHjQyhSorGkyi5sbKamtKhAiznWBDz1PvfSm7sk4EoNT0/dYutuLz
	bCihLGjBms5g5oj8YQjyYu7pKFi8lvhBTAJKyu8o6e+kUGPamzb7Qe/cuzRKHWEP5NkRQMBK7r4
	wh4ge1EK0x0IyI2m/woZNLfvTrZfTqN0oVfU0u0wZhZ1kNJEp2v4xxylkblQfk8F2wyNQOBuSNi
	VVnJDQ7wTaGaQ5BeqHulzYc=
X-Google-Smtp-Source: AGHT+IFnNFIlMm9/L/bcyHMVah+51vkdm0T/jdjxqhLQ7LFy8/zaHzLzvotK4qxuC0MECLmidBODybpZNRr9UFx4Cuk=
X-Received: by 2002:a17:903:fa7:b0:294:f6b4:9a42 with SMTP id
 d9443c01a7336-2984ed2b5edmr67173465ad.9.1763044244630; Thu, 13 Nov 2025
 06:30:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250918140451.1289454-1-elver@google.com> <CAHk-=wgd-Wcp0GpYaQnU7S9ci+FvFmaNw1gm75mzf0ZWdNLxvw@mail.gmail.com>
 <aMx4-B_WAtX2aiKx@elver.google.com> <CAHk-=wgQO7c0zc8_VwaVSzG3fEVFFcjWzVBKM4jYjv8UiD2dkg@mail.gmail.com>
 <aM0eAk12fWsr9ZnV@elver.google.com>
In-Reply-To: <aM0eAk12fWsr9ZnV@elver.google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 13 Nov 2025 15:30:08 +0100
X-Gm-Features: AWmQ_bmFh2aVYHZwkaHdVYkb7IeD9B_c5E9TrUEhRxSr8kO14B_rxSCEK8GKI2o
Message-ID: <CANpmjNNoKiFEW2VfGM7rdak7O8__U3S+Esub9yM=9Tq=02d_ag@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Compiler-Based Capability- and Locking-Analysis
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bart Van Assche <bvanassche@acm.org>, Bill Wendling <morbo@google.com>, Christoph Hellwig <hch@lst.de>, 
	Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Jonathan Corbet <corbet@lwn.net>, Josh Triplett <josh@joshtriplett.org>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Kentaro Takeda <takedakn@nttdata.co.jp>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	llvm@lists.linux.dev, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Sept 2025 at 11:10, Marco Elver <elver@google.com> wrote:
[..]
> I went with "context guard" to refer to the objects themselves, as that
> doesn't look too odd. It does match the concept of "guard" in
> <linux/cleanup.h>.
>
> See second attempt below.
[..]

I finally got around baking this into a renamed series, that now calls
it "Context Analysis" - here's a preview:
https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git/log/?h=ctx-analysis/dev

As for when we should give this v4 another try: I'm 50/50 on sending
this now vs. waiting for final Clang 22 to be released (~March 2026).

Preferences?

