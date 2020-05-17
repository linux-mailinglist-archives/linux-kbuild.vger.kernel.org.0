Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD301D6E0A
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2020 01:29:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgEQX3s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 May 2020 19:29:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726537AbgEQX3s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 May 2020 19:29:48 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60588C061A0C
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2020 16:29:48 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id v128so7541910oia.7
        for <linux-kbuild@vger.kernel.org>; Sun, 17 May 2020 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=HEbGaE2MFA3pNV7eacFtO/Z/lrFOcrYXWl9eIYThMDg=;
        b=ZVMt73rgfpMh9F65bJUqHmftDbrjRYnfjIjTOB9pszivklWHTM5rqzTZGS7G1tS6Bc
         GanWTnxJt1wAYaJQieMPLlUgwe2SwiXfD1u+y97f0+E428VjmY3VRjQXPwMk3zywAtOW
         T3bw9vp1FvUAO/LLo5O0R3lC/Lukyr3DQVODNevhpcZWtROqX7L2a2j5LX+Emfljvwvi
         Irvy8qlxSpeehSOQN1xf+XsFQmWqQXhnWuyAj15p4IS6QXxNCi8zIE1tJTiYwpemuHPv
         /S2Mz0jDzes6wQAPLY7KgSn+PgkPZZLr/xTfkCeB4NaDF7C1FPRqJ3Q5Z0Xe3JT7FACq
         RDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=HEbGaE2MFA3pNV7eacFtO/Z/lrFOcrYXWl9eIYThMDg=;
        b=AhKKWRIpNUddYBsPhTGTM7T9mZOUj1i6zKwppO3pmCQuhYKfRQBINStcX8C5okPt68
         TCdq7iDBzmEAy7PxqogOEYN25wTxTE5OZ1F4fXlr9EyUrhjQUPQKLuv3GcOUKddt35QT
         SjfdYUYeTS+UM3WM30pUf9AmpRHys1tz02zt2FOO7K1TtQ1wIpCu3bvyFqt1OpCML4tI
         BRVSi9tN5iat8kYBU1hhKAVqqHtTK/ljZHTWOTIY4j/qPyTObRnF+w8a7QuDs1lfmqdH
         WeBMVQq3HiEKwu9qIBB+uT1K/Llu0cMajENz895YXIO3JBU8oJIM05EAoHGRjdPDB4IF
         rm8g==
X-Gm-Message-State: AOAM533K4e3dQSyEUc22LmI46x+YfOwNRblwqmq5On0dnCb6zfK+28aG
        j1c1yU/Q/ptZayHpzPnKngYCM1daYpj7IQAgC6N9bA==
X-Google-Smtp-Source: ABdhPJx20wcmKJCggYeqxnzBbk931Dxv1d/HbjnLofAqSZbcnyUvwywbHF+vfABfd4j7PW9oI6usDxE21R+Y9ChV/Io=
X-Received: by 2002:aca:f00b:: with SMTP id o11mr9511918oih.174.1589758186938;
 Sun, 17 May 2020 16:29:46 -0700 (PDT)
MIME-Version: 1.0
From:   Ed Spiridonov <edo.rus@gmail.com>
Date:   Mon, 18 May 2020 02:29:35 +0300
Message-ID: <CACm0Nn02AmTtgocnCgbzWGwFGODovEzGsoASukmuRCQ5-28PFQ@mail.gmail.com>
Subject: kconfig: dependency handling
To:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi

I encountered a dependency error while executing 'make config' in a
patched Buildroot.

After some investigation, I found that such a file causes a dependency issu=
e:
config LIB1
 bool

config LIB2
 bool

config A
 bool
 select LIB1 if !LIB2

config B
 bool
 select LIB2 if !LIB1

(both A and B could use either of LIB1 or LIB2, but I prefer LIB1 for
A and LIB2 for B).

The error message is puzzling, there is nothing about A and B, only
LIB1 and LIB2 is mentonied:
Config.in:1:error: recursive dependency detected!
Config.in:1:    symbol LIB1 is selected by LIB2
Config.in:4:    symbol LIB2 is selected by LIB1
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

It is clear what is happening in this short example, but I spent
several hours to find the reason  on a real config with hundreds and
hundreds of packages.

0. Is it possible to easily fix kconfig so that it does not produce an
error on this file? (I guess no)
1. Could the error message be more specific?
2. Should documentation be improved?
I suppose this case could be mentioned in
Documentation/kbuild/kconfig-language.rst
Maybe the example above should be added as
Documentation/kbuild/Kconfig.recursion-issue-03

P.=E2=80=AFS. This is not a Buildroot-specific issue, I have checked vanill=
a
kconifg with the same result.
