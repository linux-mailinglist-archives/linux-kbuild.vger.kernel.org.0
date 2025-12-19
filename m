Return-Path: <linux-kbuild+bounces-10279-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2179CD1F67
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2671303F29F
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7702279907;
	Fri, 19 Dec 2025 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMtyxVaH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10EF330D5E
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766179733; cv=none; b=Ykt5W+TB/kNF7tuUxxgLRm3BnqT9jK3w1RG2ZmR2aPAyp6TfDPI68TGR8NDn4wUsZde5+Q+Rfs2AGrWvoZAWevaRw+SkbESTXGQWDw88imN4PT3wYYEcKdcqIYK/Zk4M0ZvkyUgsdhV9COxzZqcWpi6MEemNRk3ugU8ioEtmGuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766179733; c=relaxed/simple;
	bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FC0ObD/bn5XcN7D6g7oS06NCmHlr+kt0VHZ4g9Nh1rW1otETMjkd6umTfWqHGGQRv9c50c5CIwl2Xj/Fb2YNU4eJiJ/lGbt1wTPvT4pbjuMzDwivF4E46ZLK0sjLY05kzzEbU98W6Y83fvsXri4+HBMvmcMzXAWT6M+25iak8bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMtyxVaH; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-7fbbb84f034so1783304b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 13:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766179731; x=1766784531; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
        b=RMtyxVaHlb4x5czCBEyOx56xfjT+RNoyzgmUIOLM8rQyyjHAn8b14RHWVg+U9yECU2
         DNet9BX2LSDx+fbfhj2eagJwVgKFUN3paA/J0jVpzr17MqrPGIkC8uWMpzr25M5n/Svh
         riLL7VUKYl3lLur1iiIDnUxqZzSyVldJOlWErwA4BYTCmBjZa+IIIv/4tggBwnPyd5N1
         4sP+EomK5LaRfaouO3drpoA8BG7gNbSc2L4KFhFCx08iZDlPsih1J+3De+KvkTA6nBjx
         xSBUnB9EV5NlQAOueOI5ovsh9ZrpK2mKI2rYqZMt2HvppVyMTV6Z5xJIcetFL+mvKY9C
         JWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766179731; x=1766784531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qdyLYhk6D9KpgNEc9lTRHJNMgr66Y5zIziSEMCrXTM=;
        b=mL8epDB+9FlJ7MlrR2U9RrXjRNsmjXDjgF9P/TmsXcOpa7AXOvpV4LES1yxOOSIaza
         zgmF1okRF9MD3MF73+tTtvdBVDwaDiINjA4IUP5esO9Z6fi6tZKx62a9M/ztZ1e6J2Qn
         nOfeF6Evaitdv8RX1fst88Lrr8B/dT4MoVpzyONu8O0HTRrQlHiEEQILW7uHBiM07+It
         AoYXPnGDEaGGIEjD5lNzUYd9RLPhy3wBG+b4SSiU95pMhmV33qkSCHBsCkwfjowPtDck
         ZQCxfT5/w15O6S8Y0B6r+eAjrtteOdvxYOTPZWnw0zpTLyZhoy+Xc1gFoK81s2MgXFxj
         RU+w==
X-Forwarded-Encrypted: i=1; AJvYcCVlMGdMm6GrW8QoKpWJHOqOxs2Pd1LJCofcgkCMxMLRTr8Dxcdc63E7U6naFkHTO8AT+msKbJh4krylboA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx72aVT4mHw9vKCrR3FQoy4u2fCOBnMMeJGFJ/iP93kORAf4AII
	DlomWQPorDSDDaLu9RzG7azQd97M2+ZiTC2A+qrx6yxEvUTJ7ANhYvTT
X-Gm-Gg: AY/fxX5H8bwfq7ktzwKgaXdyku3gR7qfDZH2HJ3qq8xJ90uRxI11lxvcitBRokl+F7/
	UsTvJtSy2fXOZ7RvCi5luHXsu8h050uuLV2VBHM1daT+4iTMKOkZ1BVljcEFLMFWycCk8S7yNia
	ijClxmRebVNEJlY1wXf1l3KD3bn7PwJAqxkAZvd9zFhWL8BgL4EAqevJECQCxIizMD+5CKWWS5C
	xcamW4tN3KGNFRNuk4WWiU5A8y9Pz5p3C43Lh8quTPhR8r8sGB0Maa19XsoLww5LRaE3IEWYODf
	Dx7Plek+JguRu5c1HP0cCmOrG5jX/qb4mzSl6nMkr812fry8/7Y1x4kCIwOASnbRDHuAQxRUWQY
	2TJMrnChXm5zfcEErCgfCOP8KfsfW576+xjec40XxgmTWvkJf5115YwH1XTjGUUv3CfNbXCqhu8
	3JB4v6BcUZB41P8/S9vq34qZwOYS2rNSofssPgzd9ZI/niemLfCNBWqbgpRPrOBIvfVlDquX5+7
	Hix5mMRgvn2SNxGEZ+lHwRaRXapFojQIoFo80Z+gmgiu0AVVWH9xu6F0owjaANtjU9N2t1Y7air
	LHY=
X-Google-Smtp-Source: AGHT+IFntC97OMoIKW8iak4Csi+Sa/wJHZS2qz46SkDovenEuEnw3BILL/ha2LHm12T/rhrLMeYBbA==
X-Received: by 2002:a05:7022:6988:b0:119:e56b:91ed with SMTP id a92af1059eb24-121722e01c2mr4354548c88.30.1766179731046;
        Fri, 19 Dec 2025 13:28:51 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm12305503c88.14.2025.12.19.13.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:28:50 -0800 (PST)
Message-ID: <ecb35204-ea13-488b-8d60-e21d4812902a@gmail.com>
Date: Fri, 19 Dec 2025 14:28:48 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/36] lockdep: Annotate lockdep assertions for context
 analysis
To: Marco Elver <elver@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
 Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
 Eric Dumazet <edumazet@google.com>, Frederic Weisbecker
 <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>,
 Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Josh Triplett <josh@joshtriplett.org>, Justin Stitt
 <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland
 <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-8-elver@google.com>
 <cdde6c60-7f6f-4715-a249-5aab39438b57@acm.org>
 <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <CANpmjNPJXVtZgT96PP--eNAkHNOvw1MrYzWt5f2aA0LUeK8iGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 2:16 PM, Marco Elver wrote:
> It's basically an escape hatch to defer to dynamic analysis where the
> limits of the static analysis are reached.

That's not how lockdep_assert_held() is used in the kernel. This macro
is more often than not used to document assumptions that can be verified
at compile time.

This patch seems like a step in the wrong direction to me because it
*suppresses* compile time analysis compile-time analysis is useful. I
think that this patch either should be dropped or that the __assume()
annotations should be changed into __must_hold() annotations.

Bart.

