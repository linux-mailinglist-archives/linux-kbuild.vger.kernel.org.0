Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83391F852D
	for <lists+linux-kbuild@lfdr.de>; Sat, 13 Jun 2020 22:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgFMUnm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 13 Jun 2020 16:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726606AbgFMUnl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 13 Jun 2020 16:43:41 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4943CC03E96F
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 13:43:40 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so14871214ljn.4
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 13:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2BfAOoNlHylipQkHZS54IuR6alfNSDX+dsmEDA3779Q=;
        b=C0D4FY+NjYs9uTamZVW95WF6UsL0rKaCEvHM6NwDXJBn1TirMKtaz2pf6JH7ZYwzDT
         sL7sG7QVvFiW1cO9iMANJIe7Ykz6kLBy4C03yTDKCSgITREpqb3JsY4Io6Fb63EpJKQ6
         8FoFlfTEu+8vrU25DrTddtSXW9p3ON+79rjyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2BfAOoNlHylipQkHZS54IuR6alfNSDX+dsmEDA3779Q=;
        b=keY4tl7JIbkUeVvfYOlLzR+l9MpVjvVtBy0qQdVY1JbZeBsBj5dr7L7uGQZqeVVw/Q
         h+D4cCkvG/o0OkFEDESAIJVQhCmo/3GHVkVwzI8fAxog9ENIS62Y7lG+DaP9ugHY2XjT
         EtiI8didJzmJ0GTKK+jHqChd2CVYvVHaQGoAf1iE1noFTZiJ+BhCUPQN36q2VQSrCQO3
         ShgNfjvohgXzQ08K6QO83fou3oxR+vVzq5NDdawpDi28L1QxLeOhaYJ1r3Wnq6SYLa4K
         KMGfToSdn7PFRQP1kR82zw/i+NxHZW3IT3ZB23SeNRQDRzCpX0Rq4uv8eth5ZQsdn17D
         HMdg==
X-Gm-Message-State: AOAM532QpuNCE4n0/gr6qZ1PY23sL5Nmcnwl4TJ3L9JmIxhtp9hnRdhJ
        +wSlutAesAw+hXCzSRBQKZFADl2GqAs=
X-Google-Smtp-Source: ABdhPJwOZRqt18Tp1PU9EySdH8jRAPCJhU12WohDWBiwx371KsC8FTPNQlzfj2EMFdNV1nnoEChv9Q==
X-Received: by 2002:a2e:701a:: with SMTP id l26mr10203970ljc.88.1592081017198;
        Sat, 13 Jun 2020 13:43:37 -0700 (PDT)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id c22sm3303115lfm.25.2020.06.13.13.43.36
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 13:43:36 -0700 (PDT)
Received: by mail-lj1-f181.google.com with SMTP id q19so14866651lji.2
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jun 2020 13:43:36 -0700 (PDT)
X-Received: by 2002:a2e:b5d7:: with SMTP id g23mr8994739ljn.70.1592081016154;
 Sat, 13 Jun 2020 13:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNATsQRp=kkB+THaO23XiHZsU1xJ-B42p8sMieBgJ4uftMg@mail.gmail.com>
In-Reply-To: <CAK7LNATsQRp=kkB+THaO23XiHZsU1xJ-B42p8sMieBgJ4uftMg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 13 Jun 2020 13:43:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh7vRkvFTFFQ_TQioLmoK-HWoHMAZ65J3N9jhTHVk5ATA@mail.gmail.com>
Message-ID: <CAHk-=wh7vRkvFTFFQ_TQioLmoK-HWoHMAZ65J3N9jhTHVk5ATA@mail.gmail.com>
Subject: Re: [GIT PULL] more Kbuild updates for v5.8-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 13, 2020 at 10:56 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>  - fix build rules in binderfs sample

.. oh, and now that this builds, it also made it obvious that the
.gitignore file was missing.

          Linus
