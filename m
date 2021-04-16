Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34FF3361962
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 07:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237986AbhDPFjn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 01:39:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbhDPFjm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 01:39:42 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6945C061574;
        Thu, 15 Apr 2021 22:39:17 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id p67so12668138pfp.10;
        Thu, 15 Apr 2021 22:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q2IpgbsafY75uYCQfmC+SoKG1Ef0J5sHuVVR2O+B5xY=;
        b=YmCBiNPQAFcGQR7D1WL53T+mLDwMDIjAavFG1l2EfFqRpVwm38lulgOISjDoT89XLC
         Joimq34+bUIjpx+Th0wRsXa3b92v791L0QButYviz+B1YCNEGuL380HbpFMik9UbyU74
         qxa8B5ZHYqEMjzn1uaAR7DMJ+FkH5ta8MtJtuoTL5hTjgLB7mqaEBuiN+6NzN2r2yvx0
         RswNRaoxVis/nABOcBOEewXQwxiD3Oi9RHpvFCMxvG7FKHuYfC3hC+n14SnCsBpmh2WU
         BZpbfP04psCL7GUkaVsEHZEtiMVBPM1Dnn9ywFm0BhJRJmDALJeHbE0ovcR9dOsKXyPw
         SZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q2IpgbsafY75uYCQfmC+SoKG1Ef0J5sHuVVR2O+B5xY=;
        b=KAHV28puv16fDRy6fs7UYO+EioK2g+3mjGvh9gFpQj4LjK6qr6/mxr/7z17RFnFjNv
         WyU0+08ViBRHNRpZXmBxkuxdaQCT2QyxUmx/vIbx8QK/OnJ7rD53CUOYZ5gH8t346IIM
         zmtQObGQDleL1Ir+f5tB0EbmqEBiTPNpG6DOCp8JNzg/bK0p4GIOE7Di4H+d5ZUtKY31
         XR46SarmVYXoIj6zWL4R7pAlih51QwT5GhqMqd3v96JXA0+gZYEe27amI4ihWnJ1Q7fN
         L7NQ/s8b8jvuZ3QIlR9QcWcBi54zzmGzkviKxuuBbvIRKEUx9wY7mk3D+g7Q2RzaFGEK
         MjAA==
X-Gm-Message-State: AOAM533yA1MIu+qhu2qykYCj7ncbwR9tvAKjczUzl+LdaWufI/BtE8Yy
        hsUb+bKbqdbOdWEwNYTONpo=
X-Google-Smtp-Source: ABdhPJzaYmoHH683P7tkrffDdBUTKJYjfW0v9Ym8+OrOOi60wx0ciD+GVBXn730Q3OIYntDtxxOPQg==
X-Received: by 2002:a63:5a1a:: with SMTP id o26mr6550012pgb.327.1618551557230;
        Thu, 15 Apr 2021 22:39:17 -0700 (PDT)
Received: from localhost.localdomain ([75.167.198.216])
        by smtp.gmail.com with ESMTPSA id q13sm3643266pfc.86.2021.04.15.22.39.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 22:39:16 -0700 (PDT)
From:   Paul Zimmerman <pauldzim@gmail.com>
To:     wedsonaf@google.com
Cc:     gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        ojeda@kernel.org, peterz@infradead.org,
        rust-for-linux@vger.kernel.org, torvalds@linux-foundation.org,
        viro@zeniv.linux.org.uk
Subject: Re: [PATCH 00/13] [RFC] Rust support
Date:   Thu, 15 Apr 2021 22:39:10 -0700
Message-Id: <20210416053910.7363-1-pauldzim@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YHkaaTQ2KQML2iqt@google.com>
References: <YHkaaTQ2KQML2iqt@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 06:02:33 +0100, Wedson Almeida Filho wrote:
> On Fri, Apr 16, 2021 at 04:25:34AM +0000, Al Viro wrote:
>
>>> Are you stating [what you perceive as] a fact or just venting? If the former,
>>> would you mind enlightening us with some evidence?
>> 
>> How about "not everyone uses a browser as a part of their workflow"?
>
> The documentation is available in markdown alongside the code. You don't need a
> browser to see it. I, for one, use neovim and a rust LSP, so I can see the
> documentation by pressing shift+k.
>
>> I realize that it might sound ridiculous for folks who spent a while
>> around Mozilla, but it's really true and kernel community actually
>> has quite a few of such freaks.
>
> I haven't spent any time around Mozilla myself (not that there's anything wrong
> with it), so I can't really comment on this.
>
>> And as one of those freaks I can tell
>> you where exactly I would like you to go and what I would like you to do
>> with implicit suggestions to start a browser when I need to read some
>> in-tree documentation.
>
> I could be mistaken but you seem angry. Perhaps it wouldn't be a bad idea to
> read your own code of conduct, I don't think you need a browser for that either.

Haven't you folks ever head of lynx? Good old-fashioned command-line tool that
opens html files in a terminal window, supports following links within the file,
good stuff like that. I don't see how the dinosaurs^W traditional folks could
object to that!

-- Paul
