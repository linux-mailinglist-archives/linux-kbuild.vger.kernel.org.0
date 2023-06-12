Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C889C72C414
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 14:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233371AbjFLMaA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 08:30:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231879AbjFLM37 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 08:29:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D6CC138
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686572951;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/dgg0OgOJU12ZjehTSKhsrI3f8hl+PZj/5z+qfu7sGs=;
        b=N8+oW2ar9N1VBobdYGwAxnIZBf+VYjn2d9wv10lBsFqdnxTvJTo6F3EWcgrlare9i4NeoW
        OOFI3zda7FKtz0GlCJuMOv5GgXnHbuoBqrRJbpRThuteFmjdSlspfkEUzKSxuDud5Xro9t
        zxwqrkyPcDvwdjY1poTOoEX75SB2q2M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-gazHnfMkPeOUg3dXjnUq4A-1; Mon, 12 Jun 2023 08:29:10 -0400
X-MC-Unique: gazHnfMkPeOUg3dXjnUq4A-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-30c6060eb32so6566258f8f.1
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 05:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686572949; x=1689164949;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/dgg0OgOJU12ZjehTSKhsrI3f8hl+PZj/5z+qfu7sGs=;
        b=DcraWvenxurr6TvMDBi8Fp40cY0t1N1wA4tUIJ8j8K1Clxj6DatNOQwA9w6Ei6ELIy
         bRVp7oDLp5L39XFmw6ZBc0ly2toAeD2OmunMI1SwOH2IAnuksCeout8NAKXYRdeaXyRO
         /UyYa1jcV+GySEo830171W3LKjX2rlSzt4UbwouqMgK5vb6CkW6x5eAAwKv8hrEh5Guz
         i6dRfsMCnVZXql/1Cg3JmroWfnl7i4FzcWwBqvJ7D1w9Z8s1dxln1ZvngjHb6x0JhQpq
         JpV5JJc2wmUE2qGyv2eb8ZE4I1Ow/o/E012Px0eJemafiCZLcSSOo3QOpQpop1/C6SkR
         8OsA==
X-Gm-Message-State: AC+VfDybT3c7f10eImONKgD8CFaylijCMlNmchca3gUxzPoLUfc9ZBkz
        HNru0IZwD5tpejO7GtZuXG7+CsT/efr07JIipPLXXxlKCWQZfbqNHoV/Tl6Pu/NxXWdb9jJhlVo
        eQIzFmd2B+8qlZ+X/f8pdyzAa
X-Received: by 2002:a05:6000:46:b0:301:8551:446a with SMTP id k6-20020a056000004600b003018551446amr5487609wrx.2.1686572949309;
        Mon, 12 Jun 2023 05:29:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fBLeRHNV68IRWXYyURn+/HcT7IJFIXUfu/3QIa+LzCGdz9usgp/jdi45lJIFln4oX75UC+w==
X-Received: by 2002:a05:6000:46:b0:301:8551:446a with SMTP id k6-20020a056000004600b003018551446amr5487541wrx.2.1686572948916;
        Mon, 12 Jun 2023 05:29:08 -0700 (PDT)
Received: from [10.32.176.150] (nat-pool-mxp-t.redhat.com. [149.6.153.186])
        by smtp.googlemail.com with ESMTPSA id v18-20020a5d43d2000000b0030ae93bd196sm12301884wrr.21.2023.06.12.05.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:29:08 -0700 (PDT)
Message-ID: <29924c50-cf96-13bb-ef84-4813caa3aef3@redhat.com>
Date:   Mon, 12 Jun 2023 14:29:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     Greg KH <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>
Cc:     torvalds@linux-foundation.org, keescook@chromium.org,
        masahiroy@kernel.org, nathan@kernel.org, ndesaulniers@google.com,
        nicolas@fjasle.eu, catalin.marinas@arm.com, will@kernel.org,
        vkoul@kernel.org, trix@redhat.com, ojeda@kernel.org,
        mingo@redhat.com, longman@redhat.com, boqun.feng@gmail.com,
        dennis@kernel.org, tj@kernel.org, cl@linux.com, acme@kernel.org,
        mark.rutland@arm.com, alexander.shishkin@linux.intel.com,
        jolsa@kernel.org, namhyung@kernel.org, irogers@google.com,
        adrian.hunter@intel.com, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        bristot@redhat.com, vschneid@redhat.com, paulmck@kernel.org,
        frederic@kernel.org, quic_neeraju@quicinc.com,
        joel@joelfernandes.org, josh@joshtriplett.org,
        mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
        rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev,
        42.hyeyoo@gmail.com, apw@canonical.com, joe@perches.com,
        dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com,
        john.johansen@canonical.com, paul@paul-moore.com,
        jmorris@namei.org, serge@hallyn.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        llvm@lists.linux.dev, linux-perf-users@vger.kernel.org,
        rcu@vger.kernel.org, linux-security-module@vger.kernel.org,
        tglx@linutronix.de, ravi.bangoria@amd.com, error27@gmail.com,
        luc.vanoostenryck@gmail.com
References: <20230612090713.652690195@infradead.org>
 <20230612093540.850386350@infradead.org>
 <20230612094400.GG4253@hirez.programming.kicks-ass.net>
 <2023061213-knapsack-moonlike-e595@gregkh>
From:   Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 46/57] perf: Simplify pmu_dev_alloc()
In-Reply-To: <2023061213-knapsack-moonlike-e595@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/12/23 14:18, Greg KH wrote:
> Yeah, it's a pain, but you are trying to hand-roll code that is not a
> "normal" path for a struct device, sorry.
> 
> I don't know if you really can encode all of that crazy logic in the
> cleanup api, UNLESS you can "switch" the cleanup function at a point in
> time (i.e. after device_add() is successful).  Is that possible?

What _could_ make sense is that device_add() completely takes ownership 
of the given pointer, and takes care of calling put_device() on failure.

Then you can have

	struct device *dev_struct __free(put_device) =
		kzalloc(sizeof(struct device), GFP_KERNEL);

	struct device *dev __free(device_del) =
		device_add(no_free_ptr(dev_struct));

	/* dev_struct is NULL now */

	pmu->dev = no_free_ptr(dev);

Paolo

