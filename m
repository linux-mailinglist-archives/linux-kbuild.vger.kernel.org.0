Return-Path: <linux-kbuild+bounces-5218-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0869F915B
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 12:32:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 141E91895B17
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Dec 2024 11:32:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F18071C5F13;
	Fri, 20 Dec 2024 11:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JF6ucMr+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5391C4A0D
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Dec 2024 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734694221; cv=none; b=TIXcmtLoLFfNY3MEpgGbao7zjagsD8lUEw1kQ+lAZNIlKgGZ1J2qLuT2ytaqxf87rvIwd+e2aZb6UaKiqwB75gtoN+RsW2OWSE+unCnotWfmXGHiM7sfqkxLMpenVCgaU9mY518IjbiIKTvyJs48OSJo5/K9UJrZ2yiXGXfHqyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734694221; c=relaxed/simple;
	bh=UxlI1hOO2VlvuPR99St6RTPB/yx1Qdwrv8hWWm6VGhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzl5rjGwPSG9ahPg2YnJW0sYUB33PRq7p6+8gSnIfwjr7PRshDkpPMDjLmDHixMTZ8llijwYsQw86WQvAA4XH6fGb7bNXQsobkDdTZMUseG33D90gczfPgUHWLHRa2uRBx7Ua0urJhtIlmrfI1cBU2rEhKoHlpKvzRRSuOzlgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JF6ucMr+; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467896541e1so237741cf.0
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Dec 2024 03:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734694217; x=1735299017; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UxlI1hOO2VlvuPR99St6RTPB/yx1Qdwrv8hWWm6VGhc=;
        b=JF6ucMr+GisXp1Nnbj8wkmBnzOPn/wkf/I5Hd4F/Kkz2hYNMU/ip2DOgX+Q2FIVrwN
         YmFdgSeIxY79MIahcF6Xv6r5UX3mf0ezO8DwAcl6sNHvCywd5+X1HRVKJYRFzSsksyvD
         oAazLLHyYdfvHklnOpVNQIY618Z77T++WMfeQ3kqCXljjL1SBkvoBMcf74xinAO+ahmd
         CsT9q7MYI/E4eFqisUtB1V0VIKcIOF93Mrjbna8xJSBSCw5bRTXIjtieQECb14a8eDrY
         sAHR3ZdSuqCnixPL0SLLyDrNNcFyKri23UIWbKncuK2cyKSYXm82CJCcM5GGg0ZZ39BB
         rRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694217; x=1735299017;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UxlI1hOO2VlvuPR99St6RTPB/yx1Qdwrv8hWWm6VGhc=;
        b=MIzPVapHBh/wfX3IdzTgfRKvfYrYFqh4bLFyKi3i7/Tu2voQIvZf3GFB/HL4n7T2Je
         tyzziDDoL77y/FYFiz/b4BWn02xKxxQVHU4z3REeazs5WM86zbKBM9viX1GA7Ice+zrQ
         jq88q/TLNcCSlUAHMEUeWZEk7k7J88OPVw0tYmXw/s/q4DJnPi7p4ijiEPHpZ7XAAF1O
         YMPoPgN9pz1cn4Q3MLV+/PCXnrninFqlgeLZua0EhAqn5NMilEN3mwNJ7GtYHyoNE6Cu
         AAQiB77h8iFKF1hYVtdb9XopWFLA7XTB5lT7lQXca9x0O6nGo9Yt8UAVvQFj5bY9IQQx
         hUgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6GPBaN8xsER2p2J9sb1llp9cXcBsyIpaGaRgUYTyT4Qh26+dKJNaZfwQI/T4CYG7JtxW5VkZIMflbkK8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0aIQnjCybT1UlD1ujoGukeixk9/5PTkQnm1VUXwkbVUqCcN0a
	n07AIJFJLjr6dfDHFfCxorD6gCJ1zG31ucjumhQMSQ/QT0zOlCVP90DkX5nSgXkSqxlzGAg3zUq
	O5oH2t4o6xeNG/fdySUgw4XXAw00zwdvrQJYb
X-Gm-Gg: ASbGncsF1uMm4npvIzJ0/n47wQUwzFANHKVcz668u57B1PUm3cyGbUZH/umNlNcSGnO
	xszFghlN1qYziyXP8VBqsk4KvpmEc6jS24YA=
X-Google-Smtp-Source: AGHT+IFx9U+xLB1Iah17RXYjv+Bd0r4PaIuSx7zrULAun4a/KOx5DZxVVzs+0l2hp0P/oyd9OsFZ7rNfwJqoNO4NIfQ=
X-Received: by 2002:ac8:7d41:0:b0:465:c590:ed18 with SMTP id
 d75a77b69052e-46a4c00c9f0mr2251231cf.9.1734694217319; Fri, 20 Dec 2024
 03:30:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241218-objtool-strict-v2-0-a5297c961434@google.com>
 <20241218160656.18cbdcbb93b0e0bcf28adf18@linux-foundation.org>
 <20241219010054.pxcnejgkvy3g744k@jpoimboe> <20241219221913.GA1259354@ax162> <20241219225642.ho42z3kgeuy5vq4v@jpoimboe>
In-Reply-To: <20241219225642.ho42z3kgeuy5vq4v@jpoimboe>
From: Brendan Jackman <jackmanb@google.com>
Date: Fri, 20 Dec 2024 11:30:06 +0000
X-Gm-Features: AbW1kvbUvGbS6rxlevM6v1XxoNqCZYBvRvbI0iHI4omXl8vm1sC6CfihXAB2Cu8
Message-ID: <CA+i-1C3ry8eeJ3ZgEUw+7=RteVvq61xcphg8KaYf2GBRr1mEnQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] objtool: Add option to fail build on vmlinux warnings
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Dec 2024 at 22:56, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> One thing that can help is to "export OBJTOOL_VERBOSE=1", which will
> tell objtool to disassemble any affected functions and show a backtrace
> with all the taken branches leading up to the warning (if applicable).
> Maybe that should be the default for --Werror.

This sounds very useful, I will do this for v3 unless anyone objects.
If we're failing the build the risk of a mega-verbose splat seems like
a good tradeoff vs the risk of the user having to go and read the
objtool code.

