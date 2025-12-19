Return-Path: <linux-kbuild+bounces-10281-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B68C9CD2048
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 22:38:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36CC930671F2
	for <lists+linux-kbuild@lfdr.de>; Fri, 19 Dec 2025 21:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3409346771;
	Fri, 19 Dec 2025 21:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdmRikKo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3C345CB5
	for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 21:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766180299; cv=none; b=BC5GePx+g5C4CE99CwqK76YiZNN7NnQj5AT5hgbP/yGrHDH6Ukvqlkvec46xenrMzk9y4pHYGGKEU0mkr+PIL0tk7H6BBZpbamGoVBTzS4bDRFdKm2eulsjWp7w6gLwwMxLrC7fj4kBCG29ySc+HFPMQIo6LrkLhAzvDCpZsjMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766180299; c=relaxed/simple;
	bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7HgIs7EHU1emPMsDMuz6qHeUfHbTlAlhQVn35K61XyqzH4JoMc3jSo0dsdO7pG8ayLOYKCgLRZJRCsi2t8Oxk+vvuELgqvs18VJFghhaSlIil2D1XuKAJOIpLRZlPtprfBINX7A7gpCNab7t7TVB60c7p3KddAitk9xdwNhwn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdmRikKo; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso2421543b3a.2
        for <linux-kbuild@vger.kernel.org>; Fri, 19 Dec 2025 13:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766180295; x=1766785095; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
        b=hdmRikKof1NCOF8csgsz0QaIQbkn3npdDSD2zPV9QtXzYRhlr2fqiQ078la1G3gI4H
         KLwjEi0N6X7TyNb5gaIcGne+gqCRl8yjP4bPw4gl85vCm9v/RR7i9d8vAohVFmEK+XLe
         0j1FejphZMV+eLrM/etxLWRgPv0WIT4HslD0AX19ySzvHjuoQ3Ca5+WU89yFFmqwdi+P
         +K13/FopXb+VtFX/deUCJMA6+Yh6iIRPDeWPn6xlMWeq+xRGYcw2TNnQuGGkkzzPkJO4
         8DMZ+yeRKsQgOxMH7Eq2ox/3USHl2TKTrBpTwxLfKcQu7jI9zCi62E8D8jyPmRlu+ZI1
         66TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766180295; x=1766785095;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SBHXkRgMesGUJGSlI+YkckhHJhyJOUbeeY6s/H5FeUc=;
        b=OtHrNxKxz7EWXTvFUAbt3PIFWfnrUu6JSMhiQ7vRkY1aK0X3J3fRQHpZVLp6OJqADN
         bajdRLJctBiloRZaL+GqizLtLczRoxd4USkjzkhHhwfjyfQ/vTn6ya6nfqE5alN+bbc1
         BFFyjRegtCT6C/0CFzrwnw82edsIZMTg1Zbvcj7mFJqCJwwAwRNtubMcjXBt2g8WL5vl
         fQjH41WFAeW63gUIX6WC730CYidq9DzQ8TiDhmCiRHfteeKfPPRgfORytEi3L94INxQO
         iT+LHtq7r+xIhXO33bI3SM9MHphLuhvFZlFD8172yWxqGpPHYeD6j/ENgyoNxV89RHoC
         kVuA==
X-Forwarded-Encrypted: i=1; AJvYcCWu7sa/YBCZjnkiDtN0AI4WBNrz9K2W6UT1WMFvOJJ+pxZ8yop506HThG1UIiRijxhUM1WpmjGqkdiFQ7k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfxB4sXDYK8/KmdIvDudXImG4jcfeYRptk2XmNmVm5IadEwH0k
	ltfJ8YBPmYoL/0CSWXMKjlCyjFo7cozP88Y7fnDosT5PjAXu2NjmFsTlmpJEnzhHjxY=
X-Gm-Gg: AY/fxX7l/GTEm3V3Hl0rZtss+C5zS+S36aNYLbU3NIT7cGny8DDzJxKR14dC7FOt5cp
	j9WKlEE790YHfv9k5PJkJphRDYOxdQl+jHD1Tm12UlbDIWH3V/gW7Z+2T0sIbTCRy6qv3p/tCn8
	iPOKRBJyEZ+FkUH51q3cpaC8PSMe3MkUb9Vp+JmqaARGKk9xQ+6BuRAyipMm08RuXX+a2140nnC
	GYI8WATTiEt4hWTd2XLQUme+VAGsJWvH4Gt39X7yfCS7fUdDpG/YPGOzlVeTBS4Rbh3qxixThMp
	bYwGGuUNMIn8vtfl9Zj3+np98RD3ppHxVrRTrrfLm6QGE5/HzFhC4SPJ6q03JtUj6k9xpz8+7Lu
	GG0sFg93SpnBlQmiCMXJ2ZpYPV6iPqVxU/0LgeVNVaURhsImxD7DQcFfNJiW9q7WkiUhl2ZQzNI
	PNm4A8/5I1VvV8S9OaukoFijsWuwU1SHrtKwXEQ81cMyjhymOZH4xAOEExQ2k4zt7+/S6FzfuND
	wuyFcv86t04h3xPewtpX/MlKGyZNk1ROgayQ4HkeqwAcLV6YioEPTMuHGCx/NsoNbn3n0/lFrBR
	oGA=
X-Google-Smtp-Source: AGHT+IGivulZwqOvq9TkwT/0JBobQprm3JRJ6VtJUw4ydSXEmlT/iKTWxEeMw8/Q4ZWRYLdEwZEKQQ==
X-Received: by 2002:a05:7022:e0c:b0:11a:f5e0:dc8 with SMTP id a92af1059eb24-121722f462emr3455845c88.28.1766180295388;
        Fri, 19 Dec 2025 13:38:15 -0800 (PST)
Received: from ?IPV6:2a00:79e0:2e7c:8:5874:79f3:80da:a7a3? ([2a00:79e0:2e7c:8:5874:79f3:80da:a7a3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm12051531c88.1.2025.12.19.13.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 13:38:14 -0800 (PST)
Message-ID: <34cda24f-acdc-4049-9869-b666b08897d9@gmail.com>
Date: Fri, 19 Dec 2025 14:38:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/36] compiler-context-analysis: Remove Sparse support
To: Marco Elver <elver@google.com>, Peter Zijlstra <peterz@infradead.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Will Deacon <will@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
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
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
 Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>,
 kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-24-elver@google.com>
Content-Language: en-US
From: Bart Van Assche <bart.vanassche@gmail.com>
In-Reply-To: <20251219154418.3592607-24-elver@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/19/25 8:40 AM, Marco Elver wrote:
> Remove Sparse support as discussed at [1].

Kernel patch descriptions should be self-contained. In other words, the
conclusion from [1] should be summarized in the patch description
instead of only referring to that discussion with a hyperlink.

Thanks,

Bart.

