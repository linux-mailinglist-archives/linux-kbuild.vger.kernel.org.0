Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8705A434D1E
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 16:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbhJTOLu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 10:11:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhJTOLt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 10:11:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23406C061749
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 07:09:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s61-20020a17090a69c300b0019f663cfcd1so614852pjj.1
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Oct 2021 07:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=bHvE+aIDG0UlR6PxtdJe0Mh+aPUtzEeHtOeV9ihSjDY=;
        b=DbkV6PV59BwutYeh9OkKw5AKheGlU6vo6h9SOOLenRmqRGykv3W0GJ1hhOYRAAt2nj
         vIplHY/eHuXfgNVyW4P+4da0JYjc0NDFZIwjE1YJTPgAZIAOiJRsN5fAj82Xcv67cPUR
         sG08Otp4eiF7/aLXpWwIaFrRVzqz1Gr7K/YxVtEKBUc+yrl5mHmoWfNHubaOijQuhd08
         APd5h6aGCY7S4IAdCnSwozrGVeVM65qztm5eAneapJ2Q4c9wxIachYCRViVrOrfOyA9U
         bKqgtqNsTrrkYQFPlT2p+q8GpwKPyp7Cm0SuhEdpJe8iv92ttDh7wSECZ0qZmAUah/3u
         iROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=bHvE+aIDG0UlR6PxtdJe0Mh+aPUtzEeHtOeV9ihSjDY=;
        b=BItftEVC2J8zYQEm1xx++LDZgkY9Uio0bxR1PVfgSCQ62fgWdPYmfSmnnBAQzKmW8w
         wBNMoLTXd5bicATCTXS0jgHcYJKsvkKN6Gl7gkPsTwdXmcEfvuje4QmzdejaqkajNC5B
         yJa5KgZE3qVuOQtTP2w+q+gYBDGN3mnEtaU6mZocrHkHmpo0HcBd7EvvU2mpYyTY8yk3
         mDfy0ngMHb69BWUCZS+AQYsj4YoPzi9AeLb7t0gmrJZJf+QP58yDHsBjIOSGPMqIHD4Z
         8MoAxWE9rA5tCybXEUbTdGBCBk+7yAzw53me87jWnNA59woUCG6GAEGMUhKsmRD6h1da
         59pw==
X-Gm-Message-State: AOAM530BE2f1vAg5k4fHkPLQH9VcR0rJRrDM56gdDrLbYXi3bTF9UurV
        tmnk6/qC5RrSje9yOuZhmi2dPynbBqFGFsI2zH8=
X-Google-Smtp-Source: ABdhPJxkMR9svis4sQpHw4k6IuVfoUZJ3g+6mcXqA/LX1L4UsbCmqBXFxxnMV668dVc9us0d4HxoAXCEDBE+6N5jHmY=
X-Received: by 2002:a17:90a:b117:: with SMTP id z23mr7793841pjq.74.1634738974706;
 Wed, 20 Oct 2021 07:09:34 -0700 (PDT)
MIME-Version: 1.0
Sender: faissouyessifou@gmail.com
Received: by 2002:a17:90a:510f:0:0:0:0 with HTTP; Wed, 20 Oct 2021 07:09:34
 -0700 (PDT)
From:   Cherish Herman <cherish.herman01@gmail.com>
Date:   Wed, 20 Oct 2021 15:09:34 +0100
X-Google-Sender-Auth: bEO1OPP7ta1xo1cTpjEAyEe9I7Y
Message-ID: <CAKxpEmKN6PNCZd=SPRuteYWEmP4-d3ogzFNgTcUJqGYcfU+eHQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello, have you received my email Message ?
