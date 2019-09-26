Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 757ACBF7C2
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2019 19:41:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727774AbfIZRl4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Sep 2019 13:41:56 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:39911 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727646AbfIZRl4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Sep 2019 13:41:56 -0400
Received: by mail-vk1-f196.google.com with SMTP id u4so632819vkl.6
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Sep 2019 10:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=/aQnvNtKAzvJVUVwttPABtTYe8m3cj+zqlTqaACgUPg=;
        b=Ncwhyr2w2XszLeLFDGFqqJyPNPEz9YSBaeKcMY8Qhu6JDFG0QlEuID+KeMlP7QFabl
         q5G6LHKzOV+pdmaYmoLRV3pkPKX6MyasgJGaEYoR7W3pbh0CaIl3JAXmUcSyOPaTzoiH
         viXZ4kg1iggGMxBACtUZwL+xmVpvY4mU1MizHqoqOmgmEVl9YVSt+oK6aNvtuduKzOnC
         mrR43tn5dA/mytrmO1WUwnDEfCqqtMoGQlsA/Iqjm9qoY35kMYJ9rCedLKQEIUOhHU96
         RxvIkdBReAyQIzep2AAVqkbSnLvc+ufUFcA8CkSRo+r5yRkqTkmu/J0HHjTeJDaI/XQY
         R45Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/aQnvNtKAzvJVUVwttPABtTYe8m3cj+zqlTqaACgUPg=;
        b=B0w23c4MKv1/1v/dkcdJ2v9eZDrnc1L7ABBbIas8LUigJwcONPR7CmGG/mI9JU3O/k
         uWu0vgAqKMbHCtc1UKsnE18UaSQmvt6CCKTadaPIfrBlOG/XrLNiKglf8Dp7YR0dK8fG
         JlajDMHIKbLbdpTDLPFuy1X5by9bS96E0nn/rxH1JjnB2M2pwSi8iwO25IUKf7VdVU9Y
         C2c40oZQRrBl5a1UqvMORfrAspxMbyYWFfFQXb0+w4zLWrPpV2c/DoI38Zzc+TAgxnSV
         d9KgrZk8FguDFxffKDOwwEY8TzA6/Lf7p79y46GREl2c4HsDpd8GwYsGL597mmkaG04U
         0qDw==
X-Gm-Message-State: APjAAAWRr0d/Lf9LBvedIMzklLAuSNB1qtr2T+MLAuCEKoc5ZMIcuAwn
        Na+XlS9JLGyV+gYl8Pyd55E02T18HWHdWZLBL+Uxx/r3N3EKJg==
X-Google-Smtp-Source: APXvYqz1iHmlwZ5xJw7vXweFTKPd4limzmcxoMjo5+/JahznNAHpduaBjhdASrYWf6L0exEzOeHanuiBq3G29qgAVOc=
X-Received: by 2002:a1f:d483:: with SMTP id l125mr2354375vkg.12.1569519715439;
 Thu, 26 Sep 2019 10:41:55 -0700 (PDT)
MIME-Version: 1.0
From:   constant override <constantoverride@gmail.com>
Date:   Thu, 26 Sep 2019 19:41:13 +0200
Message-ID: <CAKYFi-4i-rspPYsYPznjcU+_v02sKEewxFLQuHyx6i11v85UWQ@mail.gmail.com>
Subject: scripts/kconfig/nconf.c stuck in infinite loop in search
To:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

please have a look at the path/solution here:
https://bugzilla.kernel.org/show_bug.cgi?id=203437#c0

thanks!
