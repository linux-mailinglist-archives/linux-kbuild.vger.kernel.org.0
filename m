Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2717C784E71
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Aug 2023 03:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbjHWB4B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Aug 2023 21:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231995AbjHWB4A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Aug 2023 21:56:00 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01842E4A
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 18:55:57 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-68a3582c04fso2113313b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Aug 2023 18:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692755756; x=1693360556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fRkiScFMOgu2DA/fAKYSlm8Q7j2pyGv/X1yC33C77yw=;
        b=HAGOCxI6iSypFKwhotPIf5nC833CPY2kkuxhaLKQ5oJYz/hNBnAJ5WfPzvubuIYCJH
         GgwWnGqiDJG4ZhLw4gmuXLZsWebzsCvpxs7ffjZkH5Mhl8FkhubgtJBYvHAKgVdoyH/d
         5hXDGREcRSxo0nlATiixeAn1ZjUlOzv8VGpPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692755756; x=1693360556;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRkiScFMOgu2DA/fAKYSlm8Q7j2pyGv/X1yC33C77yw=;
        b=HCIFxZZ0G/lQgvJGbQTTnUeGbPictaRaARV17RCRZd3aspIM8S/3E7Rr51QkJitAOM
         KlqtryhHBE7R/hTR69eRB7WGzzogE2Dkhb9u46A7jahLeWiI46XrujmdwGtjv8MT1SUH
         Hs5hq7PZiBuFzWs/q8T53HtO5VULwVKFlYg13eZYosy2LknaUGfM7aOBjBntmpEsfmFb
         YhOiTF2epuAOgiGGera0jKUt8Qtp92MsNpHZthgQNcnz3aCWf1LxLzES4+WKerkgDHSq
         kMwozGFWfmjwsJxUJjnyXpNHHjgz2QOP/6W0vKSXw+lPprfdE47BpQXeJ42/c/rJEkQA
         UkfA==
X-Gm-Message-State: AOJu0Yy7coEnOa1LmVsn+I4XpVVzQqF5CVmdDX+3ck77CWxAYpSjL/eT
        Hwdg6iZzG2kTqlO4+EyTON2DsA==
X-Google-Smtp-Source: AGHT+IF9DYgiYQneYQNwX7Ayy+tzBw9tZVdJ5vCPBzs3OK5K5JOJFUBVa2o7P+C2g86YTNuREqWVUQ==
X-Received: by 2002:a05:6a20:72a4:b0:133:bbe0:2ff1 with SMTP id o36-20020a056a2072a400b00133bbe02ff1mr11542589pzk.44.1692755756380;
        Tue, 22 Aug 2023 18:55:56 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id h9-20020a170902f7c900b001bbb598b8bbsm9684771plw.41.2023.08.22.18.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 18:55:55 -0700 (PDT)
Date:   Wed, 23 Aug 2023 10:55:51 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Ying Sun <sunying@nj.iscas.ac.cn>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, sunying@nj.iscas.ac.cn,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Siyuan Guo <zy21df106@buaa.edu.cn>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jesse T <mr.bossman075@gmail.com>
Subject: Re: [PATCH] kconfig: add dependency warning print about invalid
 values in verbose mode
Message-ID: <20230823015551.GB3913@google.com>
References: <20230809002436.18079-1-sunying@nj.iscas.ac.cn>
 <CAK7LNARH-ziDD8=+90y5Zzo0cqqnc5qaiVWW0YQzdZ=nO9+e8w@mail.gmail.com>
 <CAJFTR8SajdzT2kKscEpPon9faUa8tHrvYPC_+awG3VeHVS8sSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJFTR8SajdzT2kKscEpPon9faUa8tHrvYPC_+awG3VeHVS8sSg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On (23/08/19 22:40), Jesse T wrote:
> > > From: Ying Sun <sunying@nj.iscas.ac.cn>
> > >
> > > Add warning about the configuration option's invalid value in verbose mode,
> > >  including error causes, mismatch dependency, old and new values,
> > >  to help users correct them.

Are those really errors?

ERROR : CLANG_VERSION[140006 => 0] value is invalid  due to it has default value
ERROR : CC_IS_GCC[n => y] value is invalid  due to it has default value
ERROR : GCC_VERSION[0 => 120200] value is invalid  due to it has default value

I'm using clang, so corresponding options are set accordingly in my .config
