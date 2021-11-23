Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D6A845AEF8
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Nov 2021 23:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234105AbhKWW1B (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Nov 2021 17:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233055AbhKWW1B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Nov 2021 17:27:01 -0500
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33BF0C061574
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Nov 2021 14:23:53 -0800 (PST)
Received: by mail-ot1-x333.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso1130053otr.2
        for <linux-kbuild@vger.kernel.org>; Tue, 23 Nov 2021 14:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=PqPWpaKN9Ih5a2VjcG6Bb8Mw/WAw3kSHvfuLFZZUl5w=;
        b=jIEtDo5FU1eVjwMraHGXBd0vVJjsoyvWxY6fvIzjZdo7GNlBxDKMokcwpa4WMpx6aO
         fh1jYDYjseaKgmAQ7s03tKnEu8fLbTduK01vroxv+WzUg8K0hBjEttRjwrd3UumIRJ7T
         +udhelQx4pVrx4tHOpbFtwmqT4gcZafdmnQQCFEa9keOAGm0uHsYQd02JhRhjXuVSYvN
         SXkKLGYRZijhWiGUuGwwJjZi91ihFAckCsMAF+5NGUQczPGfXK9k/u5g3TK/pxCN8vqG
         v433r86M5GY+kMBC0btaMawqij9Eg574N57VIgk5DIQbXB6qld4JInqzasxc/9A7pOAf
         t4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=PqPWpaKN9Ih5a2VjcG6Bb8Mw/WAw3kSHvfuLFZZUl5w=;
        b=7gzAVGbGD7PcoQbvWcsLzM221LMs5VPZbjqo8PH9rFt35shqYJU5gABgyV/3qJIDw6
         JdS8ASyLfW6nzEtLAtZuBiXEDlz7BxI8D62/1lzbL0AoOFuXwsiox3Hbugu72DwlYb6p
         e5rIT8gACyyhWtl9MTzKlA31s7CHPjMurvE3sU/iVqvVdHjzGTibw/5zczXFnyoKCAlI
         ucyAhP3QicMXRkyJzZyVeatGKAxo2UqDKv/TZ1QYkt/qW/nfaGX3NKIu3VoidaK3b4Lj
         ImzJ1VU7OINvFnQqeEhPIKnUAph4IiJCpA9AhJAYwJ4y10mM+zO4Q7bBjbvI3iKiS9Nh
         sjcQ==
X-Gm-Message-State: AOAM531jbGnJ0JLVrp/nTSjQnCVUvFvfPAEJiuB6FNSXItWYkyPlDHdw
        UNzD4aWQYvW/sUkxfgl+XGTucXW6J51wqIvYD48=
X-Google-Smtp-Source: ABdhPJyk75LhwWzx/9pBMsw+cDhB/aLMP7+96cP9ihY/jsPSaIPUPQ9TUSigl+jzVo6++IWTFjCKrgpyO0keQN3I888=
X-Received: by 2002:a9d:7601:: with SMTP id k1mr8041992otl.356.1637706232683;
 Tue, 23 Nov 2021 14:23:52 -0800 (PST)
MIME-Version: 1.0
Sender: ndjarama@gmail.com
Received: by 2002:a9d:222e:0:0:0:0:0 with HTTP; Tue, 23 Nov 2021 14:23:52
 -0800 (PST)
From:   Kayla Manthey <sgtkaylamanthey612@gmail.com>
Date:   Tue, 23 Nov 2021 22:23:52 +0000
X-Google-Sender-Auth: 0ccoHJ78kVU5GeGGP7osUx4NqCA
Message-ID: <CACa0hk-0Np9OuOLNy4LLCs__ps=L1J3sH2F1Au2X81vQuUzTEw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Ahoj, dostal jsi moje dva p=C5=99edchoz=C3=AD e-maily? pros=C3=ADm zkontrol=
ujte a odpov=C4=9Bzte mi.
