Return-Path: <linux-kbuild+bounces-10295-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A14ADCD2303
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Dec 2025 00:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A27A3001BE9
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 23:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8803A1E64;
	Fri, 19 Dec 2025 23:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZdHVANx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8392264A3
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 23:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766187243; cv=none; b=IJcZX768qAjAbm6ZV8beB5iOxg1C1C21eYXNQkR86OfwSYDu8T10+G9S6kP0WeiUvmzzNpH3QoZBgPdBaO+8QxPxQyVYQyyD+sCrQAdmjOtzDA5NByaSgSgT4PzfFc/cTINA/tN6iLoAWnMvAaxU6W/5hyB2h1Xdpt2EBWTbrpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766187243; c=relaxed/simple;
	bh=kqYAQZ609rJygFWC7CbHOEHNatKsPADzGjHUdHPU3XE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=XPcCbGWCbiU/CIQ8iQV4HwgXB7CdDld79vXFiy8YacajUKLlCl7pQGAd5R50/+wX83y0ZNgCiMk+PFq+IgSOO/06PU+LDdGV2MlwsXg8LC0kF//GdlYB+15N8WrTjahJRZVoWZZ3cchSZdnRvdCNtgflxvPOWhjvZ1zLr8DJ1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZdHVANx; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2a12ebe4b74so35737075ad.0
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 15:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766187241; x=1766792041; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xjhz9NvSIj1nkwStS3EsBbpnWvjG3hzX9yFNjSmaNpQ=;
        b=EZdHVANxCah0uE0HuO9nwrnfMcQHofkTylE6byaAfu9iPGUMKDd2mqabziE9NZwS5/
         n0LDIx+8Pou4Mz10XLX1bx65gJz8XiGQB/HZHsGRXdUvO+z+4/24QgzEftmgoFEyPiCi
         uGJWpd0BMLo/cBSNcvoCdzLqNdrfBp/8W3PAKa8NQLfAM8HxxR1giCyXj6k9KGRgbIor
         lxTR/gP8YF+TLjq4rp57LpCLEHjuARKVqYejVENz/komQP9RMk4rMoGkSd/Fr5h4R6ir
         VUt8ccNZo2PQUOf8YZVtXWEM19uzmQ47Pdwxdh1ZHRfufKWeInUBCVUr1h0ll4WVOduv
         twkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766187241; x=1766792041;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xjhz9NvSIj1nkwStS3EsBbpnWvjG3hzX9yFNjSmaNpQ=;
        b=XF237S9Ab89+jdYKKItaiySKKsrN4PNNsgPL8PY7kqOkIghzBWIIWgk99GSmBcXWCb
         Iaiw+Imv3jJhvJz51vD4amKj6iFW7Q1fXDsHpt6+0NPFkHU6f6dfj9Tfq6MzuubH7+R5
         +Rqjh9YBtNH18sQMbGxk3qA1O1ZLDVrjiMcFNIIQ2uuHFbcB65x0ZY8FRTjN3OExR5qD
         NFobTuQ+jM4Xut2rb/M1GtEyVe6zVU45vbiHBeUFO6bckerwzqzcU/lx4IjiDUUDUFbC
         UVyCfFXoqzcxvfZfDUrWyWZo6Uq/5thWzl3JFgIRbkDzvxvebT7E0pPIdFWRACAEsHuh
         /RPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOVZMXOHDBO/pzmw0whemYq1YnQTYOAukAoK1IX2yX/kKiVASHMomXeP0XAj8T1MG0L4AdKPBReE2PfEc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn6CXmB//hOLbKxO1bq1OqAEqvMTFovk8SOUD2VyzIzk7GrNpW
	y7/AwBG08vjC435CFszZ5dPitpVl7pSDfh/dSbN65dzC9ro2BGEYrGJO
X-Gm-Gg: AY/fxX7O4awR71x+oyNCvEK65WWERZ4E9XeJqKnzdYPxxjcbEuCaL4gr0p1F6Xidmg/
	XmV2v8o4SsVZTppIUS8z18stVS4E0Vn5APfmrAMmby1DnXXhp0QwdVi5WzKKhybgM5+78On/2Ey
	noaE5hSftouHab4j0g7rJgZ1fMCi7qxY0I7X7HkBiPqyD11sC3ohiYuUSMjJrENzlEVqTmfJnp1
	GV6W5cQ9C3tHZotVoCCH2ciIcCr7HMSwYr5va7VGdt6X5F2TUZ7lArR4vLqKvBN/jqg+T5y1kzY
	9G0AdnMNOvQkQo0q7efOR+4bdu1U4JatpDh9YTOdaVb9QsRJJWmsH67B0epw6UmpqTP6DtjhiEZ
	DmaNZLg9BwZtloqoZ+V1W8u1dE+qQpML1FNUR8WYlETMdxMVQ94fDhXjNkKKvFOFlq5FEOObSXA
	QLJVm4kzjmyKPcY2hCZdknI8sBbVyFRHPUDCS1eM7oshtwJjJz1br1c6cGsbE8o2VAxm3bB0ZOC
	Ttj08KWOxxBGihHhr1dPfpomw5p3T8yM4bwZmuwylXYZpozokf66CcfP3JkYqf9ehG5oSj0PLQr
	nn8=
X-Google-Smtp-Source: AGHT+IFD9VEfhTkWGAUJ+KrkgUpiheofAxrSZVwNtEffu0+8gx+hrdlGu9tKXSDKwQO+mDr4xt9mXg==
X-Received: by 2002:a05:7022:3a83:b0:11c:b397:2657 with SMTP id a92af1059eb24-121722be81emr4954809c88.22.1766180747284;
        Fri, 19 Dec 2025 13:45:47 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm10260116eec.2.2025.12.19.13.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:45:46 -0800 (PST)
Message-ID: <ae957ee5-cb47-433f-b0b3-f4ac8ec7116b@gmail.com>
Date: Fri, 19 Dec 2025 14:45:45 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Bart Van Assche <bart.vanassche@gmail.com>
Subject: Re: [PATCH v5 08/36] locking/rwlock, spinlock: Support Clang's
 context analysis
To: Peter Zijlstra <peterz@infradead.org>, Marco Elver <elver@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>,
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
 <20251219154418.3592607-9-elver@google.com>
 <17723ae6-9611-4731-905c-60dab9fb7102@acm.org>
 <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANpmjNO0B_BBse12kAobCRBK0D2pKkSu7pKa5LQAbdzBZa2xcw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 1:02 PM, Marco Elver wrote:
> On Fri, 19 Dec 2025 at 21:26, Bart Van Assche <bvanassche@acm.org> wrote:
>> On 12/19/25 7:39 AM, Marco Elver wrote:
>>> - extern void do_raw_read_lock(rwlock_t *lock) __acquires(lock);
>>> + extern void do_raw_read_lock(rwlock_t *lock) __acquires_shared(lock);
>>
>> Given the "one change per patch" rule, shouldn't the annotation fixes
>> for rwlock operations be moved into a separate patch?
>>
>>> -typedef struct {
>>> +context_lock_struct(rwlock) {
>>>        arch_rwlock_t raw_lock;
>>>    #ifdef CONFIG_DEBUG_SPINLOCK
>>>        unsigned int magic, owner_cpu;
>>> @@ -31,7 +31,8 @@ typedef struct {
>>>    #ifdef CONFIG_DEBUG_LOCK_ALLOC
>>>        struct lockdep_map dep_map;
>>>    #endif
>>> -} rwlock_t;
>>> +};
>>> +typedef struct rwlock rwlock_t;
>>
>> This change introduces a new globally visible "struct rwlock". Although
>> I haven't found any existing "struct rwlock" definitions, maybe it's a
>> good idea to use a more unique name instead.
> 
> This doesn't actually introduce a new globally visible "struct
> rwlock", it's already the case before.
> An inlined struct definition in a typedef is available by its struct
> name, so this is not introducing a new name
> (https://godbolt.org/z/Y1jf66e1M).

Please take another look. The godbolt example follows the pattern
"typedef struct name { ... } name_t;". The "name" part is missing from
the rwlock_t definition. This is why I wrote that the above code
introduces a new global struct name.

Bart.

