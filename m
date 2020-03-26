Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C04EB193BAA
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 10:22:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726359AbgCZJWT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 05:22:19 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:52544 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726298AbgCZJWS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 05:22:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id z18so5647108wmk.2;
        Thu, 26 Mar 2020 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FlDn5DLuAGFwOKbYCG6SBICMqVpoIS+lwTO53ZZDDjM=;
        b=dnfFO30O8b3RHtisdF7O/LiOdkh/dGOet8uunkTrexLbVqPR+mk8mHCwRsw6tk7KLv
         auq6wGbDAz0TCaH7hgT3AOV6cKXX7hHNpWE2HuusvvM73PietjLjxDKuuZOqmmQ//Ul1
         jYXRonD3rZ/o40owKe3SUybXM+MEcOCrLrATCzJzVb4iH9/w+oTVltDAY8WDD19GP6PY
         kt8GSCVtHsjJMZn/k+DnyW9lAo7OQxFDDTquFzauPzkbafYzNtb5rBgX6k+HHYeA7Wcz
         y/Okk0gWNzvBzqlIHdWGI8cXCcwSCT7YlgNWhkUmWaXaLmi4gTEtwgXiUp4cqAD5niQM
         w4Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=FlDn5DLuAGFwOKbYCG6SBICMqVpoIS+lwTO53ZZDDjM=;
        b=grMH9n698ZdWvEoEyVsOTtjHzDS0mcQYMbqetBKMr79Ca1xn66q5zAk6u94q+gbY6c
         kUZ6ePJpl9lmdxNNToFhnvow1tbQLyxxpYIhGTMAsLWcg/nYY9Ssyr97/0B0GFBBAwL2
         msqGWz4O68TxC5dHiuX3hBMtW120e40G0MS79J5HoKjAW/QQUFjqpDzlo++SOCDp6/zF
         /mJiv+WwXTlLPCDSS74FbU1pzW996sHE/ix3RxKv0Mh7hnD/oSgYyxKoiEKF7a9jtiFi
         v1p1K37D6kO6tDBbe697HxYojGzRvxFQVN4Mccb2heY05dRt2Yehh5QHn8SUzSSYPge6
         kvow==
X-Gm-Message-State: ANhLgQ3jzLLn4ePZXj/tfHB+DXqj+pNK9REJHTijkb9MdEE1rLxkERWK
        +A9R5ZacDwAD8xRUlhmUFqIbcShY
X-Google-Smtp-Source: ADFU+vt9VB3BsFSpXR1BzUyvHfDJQ1tQSyYFNyjRyc3JUCaQ6kAKCPhCNBUEuy6J5/CKiAsmakOtXw==
X-Received: by 2002:a05:600c:20a:: with SMTP id 10mr2201122wmi.135.1585214536655;
        Thu, 26 Mar 2020 02:22:16 -0700 (PDT)
Received: from gmail.com (54033286.catv.pool.telekom.hu. [84.3.50.134])
        by smtp.gmail.com with ESMTPSA id l8sm2728757wmj.2.2020.03.26.02.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2020 02:22:16 -0700 (PDT)
Date:   Thu, 26 Mar 2020 10:22:13 +0100
From:   Ingo Molnar <mingo@kernel.org>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
Message-ID: <20200326092213.GA100918@gmail.com>
References: <20200326080104.27286-1-masahiroy@kernel.org>
 <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


* Jason A. Donenfeld <Jason@zx2c4.com> wrote:

> Very little has changed from last time, and this whole series still
> looks good to me. I think I already ack'd most packages, but in case
> it helps:
> 
> Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Ingo Molnar <mingo@kernel.org>

> Since this touches a lot of stuff, it might be best to get it in as 
> early as possible during the merge window, as I imagine new code being 
> added is going to want to be touching those makefiles too.

I'd argue the opposite: please merge this later in the merge window, to 
not disrupt the vast body of other stuff that has already been lined up 
and has been tested, and to give time for these new bits to get tested 
some more.

Also, please get it into -next ASAP, today would be ideal for test 
coverage ...

Thanks,

	Ingo
