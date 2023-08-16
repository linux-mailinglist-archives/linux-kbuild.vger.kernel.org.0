Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0FD77E1CC
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Aug 2023 14:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242670AbjHPMm7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 16 Aug 2023 08:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234592AbjHPMm2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Aug 2023 08:42:28 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C18F1FF9
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Aug 2023 05:42:26 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-68842ebdcf7so2236360b3a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 16 Aug 2023 05:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692189746; x=1692794546;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lAJXx3zuvSUSvm1+zrkqCECfcvDo+O7F4875vOACYRk=;
        b=j7Ox/IcgLbYiNCnKkA5P1aW1n6BF0hnr145B3ZN4i/TepbcJL0fIK1M54uaBORNhZy
         P9SLJn0HlXa5Lp7YmOigzV4PtiOVuN+XIrZyatwAJaOjlpN96THrEcau9Og5I1so3N1s
         Eg9xmL3aHJqrWT8Cf+t2sIDwVyH1SowSHBj4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692189746; x=1692794546;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lAJXx3zuvSUSvm1+zrkqCECfcvDo+O7F4875vOACYRk=;
        b=XWM74thW3hKdOv3WFaqJeoJxmMgRMdDF2rWPaMYUkmG7wJuCVMQBsJMgaFtiTxwEvf
         rFuGuqrD8kCZRFHZX5xZ4h5f2sQJd1m8mXOqnvaGluIF8nVt5DmnCYeNDGs7rL6bWAhM
         8sZGxbavILPHNDTb93i2CFiIykRS1iY4YaiVFuRHhfPo+FS+fW4ro5nfWpwe0O3if7f5
         5dr0+zcmjJ+5e1WK7saENtHO9FM9QxAX7GpJQU6WPuwNzKsQxkk+KYdAqIgOBTuJgDoP
         g7npCEs17Y+6PBgr7E5o6iE2I2uPqVbQQQxtVy4BWEagzldnVFkvgv8/ZCfUJjOhC5J1
         XOaA==
X-Gm-Message-State: AOJu0YxM2a1g/AA2Y5yacgj2UlTZczmD0XMXjNMfuSz8ud+CUqmx7js+
        gfzUQQC3hQRVs/MYq0kIfmSAiQ==
X-Google-Smtp-Source: AGHT+IFskuvVotxrDIdmeP91Bzepe2AtmyMh5/G4MEmMxSOTDyx2oIRxeNV0PaPKOnRnkSqNq1kLHg==
X-Received: by 2002:a17:90a:9f85:b0:268:34b1:a5a9 with SMTP id o5-20020a17090a9f8500b0026834b1a5a9mr1463552pjp.8.1692189745793;
        Wed, 16 Aug 2023 05:42:25 -0700 (PDT)
Received: from google.com (KD124209188001.ppp-bb.dion.ne.jp. [124.209.188.1])
        by smtp.gmail.com with ESMTPSA id bk18-20020a17090b081200b002680f0f2886sm930591pjb.12.2023.08.16.05.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 05:42:25 -0700 (PDT)
Date:   Wed, 16 Aug 2023 21:42:21 +0900
From:   Sergey Senozhatsky <senozhatsky@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Tomasz Figa <tfiga@chromium.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: kconfig: list unknown symbols in the old .config
Message-ID: <20230816124221.GH907732@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

We recently were hit (unnecessarily hard) when after kernel uprev we
figured that something wasn't working. The root cause was a rename of
the CONFIG_FOO option between kernel releases, which make oldconfig
doesn't warn/notify about.

Would it be possible to add either a new --listunknown mode to conf or
to somehow make it conf_warning("unknown symbol: %s\n", line) when it
reads a line from oldconf that it cannot sym_find()?

That would save a ton of time.
