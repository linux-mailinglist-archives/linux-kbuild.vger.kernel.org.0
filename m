Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEECA22C71A
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Jul 2020 15:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgGXNxz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jul 2020 09:53:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726366AbgGXNxz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jul 2020 09:53:55 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04932C0619D3;
        Fri, 24 Jul 2020 06:53:54 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id q4so3867032edv.13;
        Fri, 24 Jul 2020 06:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=cTxDphoe+vLxnF+A2C9bqEgwZdV601VaJb/lXVid7sA=;
        b=mmK0swhDn4cPwzKbdQaVqJyXHitxeFtwO979jh/H41YMrA9DUbreb4Gui0K31xj5NH
         hOakHWtY582/0yFRmicn4GpVfev8GM5P7xHjoA876BCXf0ljQKgSNOIZ0s2D2qx0e4hW
         fjZULokGDmO/+0WRz4ZqNe/cPaK7MRon7qirnwg/Rh6kRPHanGMKkv4PSr6khDrpGdLF
         +Sf7GfqOWyj8eFLg5OgTIVXoDkenlXCklXpzyvCJO8Mr4phhTlXL3QdwZfp4IAT8oupm
         midhF7Bu0oGeyEA3obkIh4EM8kWM9eVibSE8vSi+pXQZ8Dtdk0Smc+39F60+0lxh9H7I
         spXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=cTxDphoe+vLxnF+A2C9bqEgwZdV601VaJb/lXVid7sA=;
        b=YUaXu4J91igndDpan5wYC/Wfx6wenK7VTwnq6zgngOgGITBu7B+SwSc0LW/TANnWYy
         5D8c7DAWBKJkTTWsdfcbdHUrOoSO+WGkaP73yBbV8wLB5l0OyUH8rykPNeIy9KCefUXw
         33HIIAI/fPZEryq+brqk2p+x706B7GpJLlz8ZVdU5GbeRAdOU7tn8RDtt822xb6i8I5O
         k9THmz2NLMLfZ6ml2uMOJHhN3pfByaxD6MzDlBbloT4OnlodWeg0upaZfitw1IeWZF8+
         26HvhnJXJiv0w8MPx4x8JZVV1RI3pDCAsQqt4qBtJSjtFrC85W+9hY9vDCSooiVIS5yf
         wm7w==
X-Gm-Message-State: AOAM531eguwSqnavT4SgCPry0L9TsqlxwbFFTD2w+mW5Hv0rpD3oSdyv
        9IZbZOnEYH5mgzpy1lPHErg=
X-Google-Smtp-Source: ABdhPJz7uGKvAKS8JJWSFmBybH4/rkm6kX1pl/E/E9QQ3Z1uGV4NGBdCPC70QUDJySOQDC6oA7ddTQ==
X-Received: by 2002:a50:fa4c:: with SMTP id c12mr6635866edq.5.1595598832764;
        Fri, 24 Jul 2020 06:53:52 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id i8sm777537edt.19.2020.07.24.06.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 06:53:52 -0700 (PDT)
Date:   Fri, 24 Jul 2020 15:53:50 +0200
From:   Ingo Molnar <mingo@kernel.org>
To:     Huaixin Chang <changhuaixin@linux.alibaba.com>
Cc:     jpoimboe@redhat.com, bp@alien8.de, hpa@zytor.com,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        luto@amacapital.net, michal.lkml@markovi.net, mingo@redhat.com,
        peterz@infradead.org, tglx@linutronix.de, x86@kernel.org,
        yamada.masahiro@socionext.com
Subject: Re: [PATCH 2/3] scripts/sorttable: Build orc fast lookup table via
 sorttable tool
Message-ID: <20200724135350.GA648324@gmail.com>
References: <20200723034643.33537-1-changhuaixin@linux.alibaba.com>
 <20200723034643.33537-3-changhuaixin@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200723034643.33537-3-changhuaixin@linux.alibaba.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Huaixin Chang <changhuaixin@linux.alibaba.com> wrote:

> Since orc tables are already sorted by sorttable tool, let us move
> building of fast lookup table into sorttable tool too. This saves us
> 6380us from boot time under Intel(R) Xeon(R) CPU E5-2682 v4 @ 2.50GHz
> with 64 cores.

Neat!

> +struct orc_sort_param {
> +	size_t		lookup_table_size;
> +	unsigned int	*orc_lookup_table;
> +	unsigned long	start_ip;
> +	size_t		text_size;
> +	unsigned int	orc_num_entries;
> +};

>  
> +#define LOOKUP_BLOCK_ORDER	8
> +#define LOOKUP_BLOCK_SIZE	(1 << LOOKUP_BLOCK_ORDER)
> +
> +	for (i = 0; i < lookup_num_blocks-1; i++) {
> +		orc = __orc_find(g_orc_ip_table, g_orc_table,
> +				 num_entries,
> +				 lookup_start_ip + (LOOKUP_BLOCK_SIZE * i));
> +		if (!orc) {
> +			snprintf(g_err, ERRSTR_MAXSZ,
> +					"Corrupt .orc_unwind table\n");
> +			pthread_exit(g_err);
> +		}
> +
> +		orc_lookup[i] = orc - g_orc_table;
> +	}
> +
> +	/* Initialize the ending block: */
> +	orc = __orc_find(g_orc_ip_table, g_orc_table, num_entries,
> +			 lookup_stop_ip);
> +	if (!orc) {
> +		snprintf(g_err, ERRSTR_MAXSZ, "Corrupt .orc_unwind table\n");
> +		pthread_exit(g_err);
> +	}
> +	orc_lookup[lookup_num_blocks-1] = orc - g_orc_table;

Yeah, so now this definition of LOOKUP_BLOCK_* basicaly duplicates the 
arch/x86/include/asm/orc_lookup.h size, with no obvious link between 
the two. This is asking for trouble.

<asm/orc_lookup.h> looks simple enough - can we include it in 
scripts/sorttable.h?

Or better yet, please move these two defines into <asm/orc_types.h>, 
which is already included in sorttable.h.

BTW., please update your patches to spell 'ORC' in a capitalized 
fashion, like most of the existing code does:

>  	/* create thread to sort ORC unwind tables concurrently */

Thanks,

	Ingo
