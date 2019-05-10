Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 354421A43F
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 23:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbfEJVDQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 17:03:16 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:37947 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727917AbfEJVDQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 17:03:16 -0400
Received: by mail-ot1-f67.google.com with SMTP id s19so6805309otq.5
        for <linux-kbuild@vger.kernel.org>; Fri, 10 May 2019 14:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5IJEIyLyCSAJksvWWMcYhkq2fPhEi0HHhzWa0B9yD5w=;
        b=poun959UTyB2W/CVfyfAUY2zT22NKhHXlfHj38mwp7XxmCfRoPVdR5wjjCYhZyGXFl
         6iMhNKPDXrRtESvzEmuijfXZIIpOLgbfylKNWuQ5VCTx12Rh523TaZcavsH6wPO/NVc4
         OByrPtnNgluFN9yp5gsZZs20Y3SXIaO0Jibiq61KqajYeLZuB7cZSUON0ouWFOYxfzH7
         gPddygKGscyZCDiy4c5H1gmy79Ei4Az20O8Zy7HPvI5EUhhsPLNO4rF+K370on6+Jrsi
         ZGUnFljJ/6zUTzUoXTT1DbcVGD28QPxZPIKGKIhuCRf3Aq8tEL1da08UR733OTBmQ/A0
         aSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5IJEIyLyCSAJksvWWMcYhkq2fPhEi0HHhzWa0B9yD5w=;
        b=bVhNpz4MCvUoewNiI+q6m86NatGRTSgafWmEMBssK+q9Et9/92hJzWN2HoPCcOgVxC
         HxAjVEJcM5P4QRjr2uVIAjerhvD/7xYGNnnf6U93oKzUMoeAkNmChrnETxqkP8aunN1X
         3MQEaQMrvwa3GmOJGvr5x98mGaHey8LRyDjEdc+T4dbzgbTAGcHhUrDqCGxM+GaSDGJX
         4Q8SZX6T5vLo7VuuK6b6HajDB8AGbkNvdDfJuD7fngjJ/Het0kCtqutfmcEyz3ekKojI
         uUUssrYNwEFnni0fE1p9ZjuNda5w9IQCxlgGZ2vsISzTHhbgrAjqSLlTMx5s8A0mpHHY
         lHbQ==
X-Gm-Message-State: APjAAAU6dy7fUV4ZkGbf1D8/yGD16QGEJ6aEN/L9vu5QCCng/wBpRWov
        ykO3YAYayFAO+jg93QbryVXhaSpnK5IHfff7YmS18qJggCqzUw==
X-Google-Smtp-Source: APXvYqwgcA6yncVAS9pQ5IEZn53EEFXVUcxBBNBAR44tBwIj1WK4b9ljKCumgFlc+R4555z8y1WohhyMOHMlcr8L7/w=
X-Received: by 2002:a05:6830:14cd:: with SMTP id t13mr8084222otq.25.1557522195256;
 Fri, 10 May 2019 14:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <201905100945.V7PLp0za%lkp@intel.com>
In-Reply-To: <201905100945.V7PLp0za%lkp@intel.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Fri, 10 May 2019 14:03:04 -0700
Message-ID: <CAFd5g46nZ0=Djo6d6iqdSQLaLP0Qq5bC+uzyjpqp5fXnty7YOg@mail.gmail.com>
Subject: Re: [kbuild:kunit 14/17] htmldocs: include/kunit/kunit-stream.h:58:
 warning: Function parameter or member '2' not described in '__printf'
To:     kbuild test robot <lkp@intel.com>
Cc:     kbuild-all@01.org, linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Felix Guo <felixguoxiuping@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 9, 2019 at 6:23 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kunit
> head:   c505c0b2e6237c729634327c178f5b0094f1c958
> commit: c69e87665049970d1c2d6fe2fa1ae7a7c8655420 [14/17] Documentation: kunit: add documentation for KUnit
> reproduce: make htmldocs
>
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>):
< snip >
>    drivers/gpu/drm/i915/i915_vma.h:50: warning: cannot understand function prototype: 'struct i915_vma '
>    drivers/gpu/drm/i915/i915_vma.h:1: warning: no structured comments found
>    drivers/gpu/drm/i915/intel_guc_fwif.h:536: warning: cannot understand function prototype: 'struct guc_log_buffer_state '
>    drivers/gpu/drm/i915/i915_trace.h:1: warning: no structured comments found
>    drivers/gpu/drm/i915/i915_reg.h:156: warning: bad line:
>    include/linux/interconnect.h:1: warning: no structured comments found
> >> include/kunit/kunit-stream.h:58: warning: Function parameter or member '2' not described in '__printf'

This looks like a bug in the kernel-doc parser: __printf in this context is:

> 8dcda743 Brendan Higgins 2019-05-01  56  void __printf(2, 3) kunit_stream_add(struct kunit_stream *this,
> 8dcda743 Brendan Higgins 2019-05-01  57                                      const char *fmt, ...);

which is an attribute to tell the compiler that this is a printf style
function with a printf style format string; it doesn't make sense to
describe it's parameters.

>    include/kunit/kunit-stream.h:58: warning: Function parameter or member '3' not described in '__printf'
>    include/kunit/kunit-stream.h:58: warning: Excess function parameter 'this' description in '__printf'
>    include/kunit/kunit-stream.h:58: warning: Excess function parameter 'fmt' description in '__printf'
>    include/linux/skbuff.h:897: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
< snip >
>    fs/debugfs/file.c:439: WARNING: Inline literal start-string without end-string.
>
> vim +58 include/kunit/kunit-stream.h
>
> 8dcda743 Brendan Higgins 2019-05-01  48
> 8dcda743 Brendan Higgins 2019-05-01  49  /**
> 8dcda743 Brendan Higgins 2019-05-01  50   * kunit_stream_add(): adds the formatted input to the internal buffer.
> 8dcda743 Brendan Higgins 2019-05-01  51   * @this: the stream being operated on.
> 8dcda743 Brendan Higgins 2019-05-01  52   * @fmt: printf style format string to append to stream.
> 8dcda743 Brendan Higgins 2019-05-01  53   *
> 8dcda743 Brendan Higgins 2019-05-01  54   * Appends the formatted string, @fmt, to the internal buffer.
> 8dcda743 Brendan Higgins 2019-05-01  55   */
> 8dcda743 Brendan Higgins 2019-05-01  56  void __printf(2, 3) kunit_stream_add(struct kunit_stream *this,
> 8dcda743 Brendan Higgins 2019-05-01  57                                      const char *fmt, ...);
> 8dcda743 Brendan Higgins 2019-05-01 @58
>
> :::::: The code at line 58 was first introduced by commit
> :::::: 8dcda743c31c1ffc0ac13f3d23f3dd1b85b545f8 kunit: test: add kunit_stream a std::stream like logger

Thanks!
