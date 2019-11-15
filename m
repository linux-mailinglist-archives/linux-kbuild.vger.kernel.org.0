Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69581FD6E0
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 Nov 2019 08:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726505AbfKOHZQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Nov 2019 02:25:16 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38303 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbfKOHZQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Nov 2019 02:25:16 -0500
Received: by mail-wr1-f65.google.com with SMTP id i12so9779643wro.5;
        Thu, 14 Nov 2019 23:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d+AJ4BxgAD1ZR5YtMJu5l/SPY546SyOeW/ALaWRlSX8=;
        b=ErPukpXX60FNsAiXULBdlCclyamDqA8kk+bEWCSwx6oDwHj+D7Zptwi9x/47xi6dNq
         QvmzRrpgQBUYCDpNTTqh68RciKxt8UnBdQR3ZbtrwcWKKU88uRLoN+oqNC5OWXub+lkz
         E1BK/EWmigmZiKoiqcOklWIReiSf9VR2LT/FAbJLPsT/iKlX3Uf6mwl/YeCRGvUG6Dgf
         aLJVcBvJi42DovaVPv3xEPLHam+WLLUkW1f9K6uSJwjDj4reuKR+F64XsDhLao5+m4b7
         6cjgcrsvJrhW3djfSwMrvqyw9Rn7E8w/YvjUTyxXx9SV9u2I4H6yVr8smCL8zxdQX54Q
         qzaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=d+AJ4BxgAD1ZR5YtMJu5l/SPY546SyOeW/ALaWRlSX8=;
        b=Cx0ZNQyaMBl/rmW+9MpTohH97Uy0yOq9srpZV2a/PNQ/yJnxcLxpVkJwaEJQ4WEyJG
         0mFIiEYCjCnisPbPyZCWfu2B1JFGKxgSeOBbQNZ8ENhVAPtND7I7AH16sJoL/hNqFn7K
         B9pmQMixLvCZ8uuENVH+pf7C+JfgMXesFVG6TFcI2oOdH8eNmSRkYvDtcAt6liHcgV2q
         FAO1Qg/mdPpjL2gH3+PbPA2MO1XXM/uiheOlql/HwstLAWwxofN3esw8/wigr2jBVyN+
         a+faHthgbJmu57K5517TUXY6M1EVWJo9m5KR0J88NCr0+TeO9eAixisneauF2ph8+Y0E
         MUng==
X-Gm-Message-State: APjAAAUoT+sNmS0bBcw8/v+ZoW8YKPWJnoFdWLdXyA7bKpKMNLJQArdh
        qIRPTH6uu06+pU1BSPZJxFc=
X-Google-Smtp-Source: APXvYqxRPXREwyzIlYws3r9EGVsO8dcI8C7pBddq1gENBucLC7TM8CuNOBdJs+nKHBxxwsJMeKJXyw==
X-Received: by 2002:adf:ef86:: with SMTP id d6mr13328931wro.118.1573802714336;
        Thu, 14 Nov 2019 23:25:14 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id m15sm10817354wrq.97.2019.11.14.23.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2019 23:25:13 -0800 (PST)
Date:   Fri, 15 Nov 2019 08:25:11 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v3 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191115072511.GA114447@gmail.com>
References: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191115064750.47888-1-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Shile Zhang <shile.zhang@linux.alibaba.com> wrote:

> Hi,
> 
> I refactored the sortextable code and add ORC unwind tables sort
> support, for kernel boot speedup by sorting kernel tables at build time
> as much as possible.
> 
> Followed Peter's suggestion, I put ORC tables sort into a separated
> thread makes these tables sort concurrently. That helps to avoid
> kernel's link time as possible.

Could you please also measure how much boot time this saves, 
approximately, and how long it takes to do it at build time?

Thanks,

	Ingo
