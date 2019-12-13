Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA4A311E168
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Dec 2019 11:02:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbfLMKCu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Dec 2019 05:02:50 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:38302 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725906AbfLMKCt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Dec 2019 05:02:49 -0500
Received: by mail-wm1-f66.google.com with SMTP id u2so895918wmc.3;
        Fri, 13 Dec 2019 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=heH4dTiMUIFooIBwaQ6i3JzjaVeq4HwrKlA/mTsplxw=;
        b=Jm5yq2Itp4/ZeHmuxdzZvHbSZ3YG7F4690gjxj4AzA72Zh/1ofkI3g/3ya8TJbJYaR
         Pp/vTUgbCtdC56b/ADygMA3rv797YDBUNTUlq9mRWNHru1BTDJQBXOSUFYD9sbTCmuYX
         eT1SnuZ5pQgn/jqtPC0HCQgq5VgjrwbvdaiwvJb1hGtiA0tBJbTf7bwLbfjvot2iwc96
         asYkjor8KMLad5V1f268yV+Xaq251plC7i9yX+ERKYfFWE0Jc+QgytoYmZqySM5bzDIE
         MafrxRk+x7lF9k+ld2gHyu4SUyj1ncRPhGzx7UxOYOvRZs2iF7IJ5Qna9QVUdL1LKjhe
         yswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=heH4dTiMUIFooIBwaQ6i3JzjaVeq4HwrKlA/mTsplxw=;
        b=oZV6JKwyCEmseRyWb9sIClVIZ+KJA5c2SxQ1eJYWCIKamyirvGMwdafuLd/m6AHXlY
         4qJTCcOXT8+XbEwiaacUwZ3V5Jtcaltz6tiPXWk8XfZQgDT/K4XOR8iMfNfuD3wn90MG
         V7sQEyyCNR/lanaWZyDk6QuCTCGXdAjHcqXeyWpu/1fSJHdjU9DjvHlf/14VLMccyah4
         9LY+rBplfASWi2Fv7XG9UFj+J/rASmUzd3zm7HXtG21DJghzEm0LavktQoD4GutT5A/T
         PPCEU7ClAEic8jOSNXOxWbhHbuutQRjtA++LyEIbkzQSGLIkV3gjsJcY6+8peU/JGj11
         UunQ==
X-Gm-Message-State: APjAAAXqCCzO5LgHqsxlvgzsIzeUBP2amIH2VwzBZ+8OC4EDctPirH+o
        RPsy5GvR2fGQEQ6QN9kPuWs=
X-Google-Smtp-Source: APXvYqxZeF+YTn/qxypgmq5Iun03Cc2jLm0jlGtv3L2kyb4EOrVqqwrxdaKFTA+sRVn2Qyzk26yLwA==
X-Received: by 2002:a1c:9cce:: with SMTP id f197mr11699117wme.133.1576231367445;
        Fri, 13 Dec 2019 02:02:47 -0800 (PST)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id r68sm4508488wmr.43.2019.12.13.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2019 02:02:46 -0800 (PST)
Date:   Fri, 13 Dec 2019 11:02:44 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     Shile Zhang <shile.zhang@linux.alibaba.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Andy Lutomirski <luto@amacapital.net>, x86@kernel.org,
        "H . Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v6 0/7] Speed booting by sorting ORC unwind tables at
 build time
Message-ID: <20191213100244.GB113121@gmail.com>
References: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191204004633.88660-1-shile.zhang@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Shile Zhang <shile.zhang@linux.alibaba.com> wrote:

> Hi,
> 
> Sorry, update for compile error fix, reported by Intel's kbuild test robot.
> Any comments or suggestions are welcome!

Could you please send a delta patch to fix these new build warnings on 
64-bit allnoconfig kernels:

  arch/x86/kernel/unwind_orc.c:210:12: warning: ‘orc_sort_cmp’ defined but not used [-Wunused-function]
  arch/x86/kernel/unwind_orc.c:190:13: warning: ‘orc_sort_swap’ defined but not used [-Wunused-function]

Thanks,

	Ingo
