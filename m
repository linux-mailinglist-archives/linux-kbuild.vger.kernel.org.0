Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BB722FBA68
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Jan 2021 15:56:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387536AbhASOye (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 09:54:34 -0500
Received: from codesynthesis.com ([188.40.148.39]:42346 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388730AbhASLnJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 06:43:09 -0500
Received: from brak.codesynthesis.com (unknown [105.226.15.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id C17F55F35D;
        Tue, 19 Jan 2021 11:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1611056488;
        bh=UJasUz7Q1tlBhrtFA4o79XUu3ZM1Ss9J96MEdCPFD9Y=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=M7a4/rqhINPsUYK4yAwWS5wNenrxFzB88J5zAvp4CEbnW2ZckUDUbMSAAjNP7zHQV
         vhxSQv5UM9oZ7vFo/ujwBf41xZa26ofHoUxdDQuVuneeUzbmEZKkD3na9kW4Y20H4x
         ieBofdWKXDBAusmThUgxmdiI40W6LF+CugGL/4EWao1h0dbE748ZQ42aewiTviHoPn
         fH/HhUBNuzRErLpJOq3k5oj4fvWXe226RswVJJL6wu7dYOevTy8NC9hppWETdrR8MA
         tGtSstwVKpW7qEbcoCoYJfglNRzR9B6z1OUMHerZ5vGZlxQsPgkzvyFD9fUE+fjc+V
         l8DJY6o9TlRng==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 6E6571A800A2; Tue, 19 Jan 2021 13:41:24 +0200 (SAST)
Date:   Tue, 19 Jan 2021 13:41:24 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Kconfig support in build2
Message-ID: <boris.20210119133247@codesynthesis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Just a short note if anyone is looking for a build system with an
out-of-the-box Kconfig support:

https://build2.org/blog/build2-kconfig.xhtml


As part of this effort we've also written a Kconfig language guide,
finding the official documentation to be more of a reference:

https://build2.org/libbuild2-kconfig/doc/build2-kconfig-manual.xhtml#lang
