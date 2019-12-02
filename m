Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F2310E9EE
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Dec 2019 13:10:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfLBMKk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Dec 2019 07:10:40 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36642 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbfLBMKk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Dec 2019 07:10:40 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so17106486wma.1;
        Mon, 02 Dec 2019 04:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H+WNR4Gv7wXCDUGA34sGUVp4d2Py5Z7w/w17ZTUcwFQ=;
        b=FkGIefBnFAIn4YWM26tn/56KJ0fIicD/2Ti5PnCpw9mEAzAVnUWYB8HZFkVMthf7mO
         OxV3Y04xyfYZevpNzkPxzQuRgB+OcdxqQ6LJx8bU6WOaK4xLNEdRMjukZOzGHqcz2F3K
         F+a0xOpSaGQdw9pirQaqXjQUt1S3kaqyoA90mCW8usmPTHD/IVparOHnXHSZ5pxYamLN
         g7rw4t3WAqM+Z9g3IopZJx0N2W+DVbC8awTc4iPOhDKGNab/JLhsqZkoH0OTqELYj/ER
         lwIPcu6/NDHVNvWlsryxK3AN91z81hRkzFU+9Tixa4o6+XFs27Pb/c8wgPa2iZXpB9Pz
         AEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=H+WNR4Gv7wXCDUGA34sGUVp4d2Py5Z7w/w17ZTUcwFQ=;
        b=VOCeVrI3XNRUF51KbqmMfsYdJB8CU2hACWrby1GHBJSABUnXbQnNG9DkrAVTURF2Vl
         zyx9bWwmqJg0rtzQ+sf34e1q0vy6OBKiGvU4tAA37IKOcojo1LbAQJHpuVROnoFEhB/d
         7nb8mAzDs8e5yZHsV/Str3rPe+caZyDxfAnsI/X3+5UgeyUjyVKx3/GlHJSDEiWtJmki
         Mcmvvb2b1baTqeax8oPgYd05Mj76XXjGU/xxwRlKXNH5lJFoSnQABnpXJHlwgKM+uOkE
         1hlKy2jkCfQos+jAxyPZS2r2g5ba4XCdnIPhdd7z5Wqke6mcJIeWkbsNHBAaMkvJuKhn
         YWZQ==
X-Gm-Message-State: APjAAAUkJVceStNJh/aGaXEQNuHFSsV3Yp+5zAax6kwBWcaRPsGogMi6
        hU1v+q5fnWJExV9iXQb/FEI=
X-Google-Smtp-Source: APXvYqwby5asr6kpFgXMYVtMnSO7hotnx0yL3RNXUDyflSFrfvIdfzVWXMcjF161nYpjsEW//WTcUw==
X-Received: by 2002:a05:600c:54c:: with SMTP id k12mr27760496wmc.124.1575288636871;
        Mon, 02 Dec 2019 04:10:36 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id e16sm23522479wme.35.2019.12.02.04.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2019 04:10:31 -0800 (PST)
Date:   Mon, 2 Dec 2019 13:10:29 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Shile Zhang <shile.zhang@linux.alibaba.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v5 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191202121029.GA37334@gmail.com>
References: <20191128110206.2107-1-shile.zhang@linux.alibaba.com>
 <20191202103248.GB2827@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191202103248.GB2827@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Thu, Nov 28, 2019 at 07:01:59PM +0800, Shile Zhang wrote:
> > This series refactored the original sortextable tools, add ORC unwind
> > tables sort at build time.
> > 
> > To sort the ORC unwind tables(.orc_unwind & .orc_unwind_ip) can save
> > about 100ms in my test ENV (2C4G VM w/ Xeon 2.5GHz CPU).
> > It costs about 30ms sort by new sorttable tool.
> 
> IIRC from your previous emails the new build-time sort is actually
> shorter than that, so even for single build+run scenarios we win.
> 
> The code looks good to me, so:
> 
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> Who it going to apply this? I suppose we could take it through -tip,
> like we do with all x86 and objtool related bits.

Yeah, will apply it once the merge window slows down a bit.

Thanks,

	Ingo
