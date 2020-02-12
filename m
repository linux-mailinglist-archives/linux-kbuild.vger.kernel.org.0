Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A325915B16A
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 20:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727439AbgBLT4g (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 14:56:36 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51275 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbgBLT4f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 14:56:35 -0500
Received: by mail-wm1-f65.google.com with SMTP id t23so3722790wmi.1
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 11:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qQ41iYMZO33MrUoyEW3Beg7Vzzsi5jGTe9Ra4Gt4eOs=;
        b=wCji2WQ1ILTnUjjzJRUz4oCz7XrV3NIrWY98W9S4feK3Hf3Gb7UzVvUMTQLGLQarhA
         Z71iDX5l+F6H0VteLOBcg5HtBY9V8U3aGfl0HftoKglz8RVxJIJ/v9h+AYYBS+cwtiGU
         ATv5gQtBTkukhhWvrOkoT+n4RX43Hvj/QBrCrzD9+fI3wGKBNDll1Ay90I52QtGEp5oa
         +2M1H6Jcq2pjVceTCsPUe8Oz3d+csREdnXV5Qm5S1GznGt8kP8T+vq1TFC8CmtZvAXx+
         +856xkwVgJqdGI9ZTnqPIr0t8ewOsNdmdXuzBa011faQw3rJ4E9D/kj5S/prQGPUrMA1
         28/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qQ41iYMZO33MrUoyEW3Beg7Vzzsi5jGTe9Ra4Gt4eOs=;
        b=GEKDNG1qDQ2GCmCCyjKQN28CPxXkT6KHT3B9oohquP5Ts2KsjQ2cJWr0McXGRlpp29
         0U9O+XYrUSCdpeorH3icvv6uKCk4ZzDuhorr1Ymm0VsKjkuht4blotmjm/Q53mhZWwHw
         JMHXqODwEmidt3pWzVLcxJvF4EY6BqawP1JWK37m3GEsTbnrTqb7s2U8qMVaGm0g2C5N
         2pA2QVWYdAq3d7Ac515NOMg1tIcns+9sAHaMmTInKdBE4f9mr/eTpzug0hb+NkAIv4HS
         sMJTaPqNEPdWqznSanH/Dlnee/O92eeYcFY0ZRXgC0g+YSjP3qOn+d+hqIrOXhjaqZAH
         uaFQ==
X-Gm-Message-State: APjAAAVBg2rj9phKsWk5HLi7Qwgea2davrv1aFR8Gi7DLzoYklivwhoj
        f1Yw9ZYkNNiJgaKKRo7fPxOQ8Q==
X-Google-Smtp-Source: APXvYqwEl9cQngn/7oDlMn7bWea1TxMCkOAElS0ziVIFCzxa+Eol6iOxsuuvkqztF8uDox/Brt/9lQ==
X-Received: by 2002:a7b:cbc9:: with SMTP id n9mr720068wmi.89.1581537392650;
        Wed, 12 Feb 2020 11:56:32 -0800 (PST)
Received: from google.com ([2a00:79e0:d:110:d6cc:2030:37c1:9964])
        by smtp.gmail.com with ESMTPSA id o4sm1846268wrx.25.2020.02.12.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2020 11:56:32 -0800 (PST)
Date:   Wed, 12 Feb 2020 19:56:28 +0000
From:   Quentin Perret <qperret@google.com>
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@lists.01.org, masahiroy@kernel.org, nico@fluxnic.net,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        maennich@google.com, kernel-team@android.com, jeyu@kernel.org,
        hch@infradead.org
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200212195628.GA120870@google.com>
References: <20200207180755.100561-4-qperret@google.com>
 <202002111002.wXBhAK5H%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202002111002.wXBhAK5H%lkp@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tuesday 11 Feb 2020 at 10:14:14 (+0800), kbuild test robot wrote:
> Hi Quentin,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on kbuild/for-next]
> [also build test ERROR on linux/master linus/master v5.6-rc1 next-20200210]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> 
> url:    https://github.com/0day-ci/linux/commits/Quentin-Perret/kbuild-allow-symbol-whitelisting-with-TRIM_UNUSED_KSYM/20200211-020659
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git for-next
> config: i386-randconfig-c002-20200211 (attached as .config)
> compiler: gcc-7 (Debian 7.5.0-4) 7.5.0
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=i386 
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
> >> ERROR: "trace_event_raw_init" [lib/objagg.ko] undefined!
> >> ERROR: "trace_event_reg" [lib/objagg.ko] undefined!
> >> ERROR: "ida_destroy" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_destroy" [lib/objagg.ko] undefined!
> >> ERROR: "kmalloc_order_trace" [lib/objagg.ko] undefined!
> >> ERROR: "sort" [lib/objagg.ko] undefined!
> >> ERROR: "__raw_spin_lock_init" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_init" [lib/objagg.ko] undefined!
> >> ERROR: "rht_bucket_nested" [lib/objagg.ko] undefined!
> >> ERROR: "__list_del_entry_valid" [lib/objagg.ko] undefined!
> >> ERROR: "__rht_bucket_nested" [lib/objagg.ko] undefined!
> >> ERROR: "kmem_cache_alloc_trace" [lib/objagg.ko] undefined!
> >> ERROR: "kmalloc_caches" [lib/objagg.ko] undefined!
> >> ERROR: "queue_work_on" [lib/objagg.ko] undefined!
> >> ERROR: "system_wq" [lib/objagg.ko] undefined!
> >> ERROR: "kfree" [lib/objagg.ko] undefined!
> >> ERROR: "__list_add_valid" [lib/objagg.ko] undefined!
> >> ERROR: "lockdep_rht_bucket_is_held" [lib/objagg.ko] undefined!
> >> ERROR: "rhashtable_insert_slow" [lib/objagg.ko] undefined!
> >> ERROR: "__local_bh_enable_ip" [lib/objagg.ko] undefined!

I find myself unable to reproduce this error on my box. Could you please
provide the full build log ?

In the meantime I'll proceed to send a v4.

Thanks,
Quentin
