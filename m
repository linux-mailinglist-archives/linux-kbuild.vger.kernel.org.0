Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B143A1FA41
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 20:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfEOSzK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 14:55:10 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:34879 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726168AbfEOSzJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 14:55:09 -0400
Received: by mail-qk1-f196.google.com with SMTP id c15so696149qkl.2
        for <linux-kbuild@vger.kernel.org>; Wed, 15 May 2019 11:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=F5f0jdD+RR9T1CwHPhrtmL6nHZr8J4S+eN2O4/8OKC4=;
        b=ZCwIKargplAQENz+EORz8P68NBMdXVYFWpfBRo/cEUOzEus3iToO4XzJk03IO39GSd
         3ezUsvl7qb4HryGNXrfBIxmnkccLxbs/mRXxowrK+5eN9+1uJnOB0QyvWc+uUomH8m+/
         M75yGkwFG7JACyMnBxRq437b/pL8tbI1tWu4o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=F5f0jdD+RR9T1CwHPhrtmL6nHZr8J4S+eN2O4/8OKC4=;
        b=JEt/niUkBAIb33IbZ/cQU1jpeqa8zVXqmfyLNk0aJI4kFzrL9LVILe3ngar4qjzU1H
         ZtlNrqDTpatGLFFBTLhX5CHuAR9zk8bu6vWLB27PeJvxqrM/IZScXnTRvQTSNI6MXVtb
         uYo3O67ELa07ykCNZFUdYZgT61JfLIAKzsOkmxg6HVYlxBXyiamBAeSVJBJZRqDONzNf
         F0FIigNWcuuhygIfHdlzqJrryaq+IGx9Y2aF4suaTfNxAE9JEEIvgX2AfjjDNdrw7TFe
         CWrtPfyrnd3r1QOJGNYSVp8JuC0RewBq938WnZlo0Si4oNGNmjsqCochHlocYsDwLsiw
         zFaQ==
X-Gm-Message-State: APjAAAWB/IRngeV96LRMasMOp06XHDIU8ljHV2LAGHWBj6ewN6UstjjX
        6D16JQgw69kw1mcMpqRWpQ9PZ6N582ExAYKOIp99uV/tL8HMnw==
X-Google-Smtp-Source: APXvYqyQgPG2i9G9Y5pvAdivqUrDU4uVkIDoiaIzzaePK4bbmnnM1s3rta2YGfTDdr0HkAbk7wmxTrW+c6Uy75gDoYE=
X-Received: by 2002:a37:e402:: with SMTP id y2mr29654025qkf.200.1557946508530;
 Wed, 15 May 2019 11:55:08 -0700 (PDT)
MIME-Version: 1.0
From:   Ivan Babrou <ivan@cloudflare.com>
Date:   Wed, 15 May 2019 11:54:54 -0700
Message-ID: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
Subject: Linux 4.19 and GCC 9
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     kernel-team <kernel-team@cloudflare.com>,
        miguel.ojeda.sandonis@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hey,

It looks like it's not possible to build Linux 4.19.43 (latest LTS as
of today) with GCC 9.1 (latest stable GCC). From what I see, some
support for GCC 9 was added by Miguel (cc'd) in 4.20, but it was never
backported into 4.19.

Should this happen or is 4.19 stuck on GCC 8?

I've tried doing this manually first, but it seems beyond a quick fix
with a few backports for me:

1. Disable perf (breaks on -Werror=stringop-truncation)
2. Apply https://lore.kernel.org/patchwork/patch/1005478/
3. Try applying https://lore.kernel.org/patchwork/cover/1040185/ and
discover a missing file
4. Discover that more things changed:
https://github.com/torvalds/linux/commits/master/include/linux/compiler_attributes.h
