Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165D12C47E0
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Nov 2020 19:48:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732156AbgKYSru (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Nov 2020 13:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730520AbgKYSrt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Nov 2020 13:47:49 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582A9C0613D4
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2020 10:47:49 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id m6so2916733wrg.7
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Nov 2020 10:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=MT4M9SX2NqdNuOObXhIV8Gtkw+yoDX+gRyJnh+feBwM=;
        b=NpRBHB8MNsqeS3qPFWqHcBMYQPHVl2TtIO13o9xtWg8velQuhegUjNA1qfJ3Ei32x0
         x5ZaySY5IuJRZXpfWFjFhiHH7rXH6bAK+SRYD77NdwA/M3j2xOtqF6YM/JYRZ/Hkkby4
         KFSWoUcbOfDbx1GYhgC7Ln8SN26R0uzlPxMgtMP5g/OjUwfJDPsELz4b9l8huKbqYHGi
         AEGbP6BNh/R9RXKQ2boKGdfoFyb6nkAGcx37weqb5w2r9zIdzZic8OedVlaoo6U23/o3
         B2CGV6GfWHl6UXtiJzGzSW/aPPVYJIV9Ied3f+U8gYw+0DFEkSJicg2ACPOo8wWOlhuE
         eluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=MT4M9SX2NqdNuOObXhIV8Gtkw+yoDX+gRyJnh+feBwM=;
        b=Ezt5am0DEDG1uvNDoyCLreCio5L/yPUYQ28apg7rKPdmy/OJUeZHneZaeYIPTVoMfX
         bNA/fpX8Q+S4BQW/NhblboBHjPjQSkOuEkn8CVdlA4nDJQN5cRXrz/zCsMfhYlUoCdxm
         TzyXqWjW3U3VhIa9CicPiPrN49cM5iTHidV5kLJVrNYhG41B2xuAbj1xD+xPngwT5SSk
         U+6yoijdcAmGRL7Ye7OFEBLG2tZZcEf2FjpLJLWEbucqm0uF6G4bKY1zsJ6XAUBR1RQC
         zAHtYDc1H8yNnEkyg0pFbcqIAT4QRJau1biU+U6hu/PDMN+Dmr41N347ICVu42WPeqKJ
         8c3A==
X-Gm-Message-State: AOAM533qM/HNwRzYXhSuDPR260QflTRQKqYBkpYaFiw2jmxu/6e2U/ZP
        /6/ul1RDA58RSZwnOF+bbJWUnMVtoCA=
X-Google-Smtp-Source: ABdhPJzDsIn+tWtWvy8XrYnQ5cmBxX24DW4B5q38g8jhG2SK1qZ+6bGYaujlROmIWYIIWEYiJymmkQ==
X-Received: by 2002:adf:e9cb:: with SMTP id l11mr1129743wrn.320.1606330068098;
        Wed, 25 Nov 2020 10:47:48 -0800 (PST)
Received: from [192.168.1.152] ([102.64.149.89])
        by smtp.gmail.com with ESMTPSA id d13sm6746260wrb.39.2020.11.25.10.47.44
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2020 10:47:47 -0800 (PST)
Message-ID: <5fbea6d3.1c69fb81.c9e91.eb81@mx.google.com>
From:   "Dailborh R." <risonnah.002@gmail.com>
X-Google-Original-From: Dailborh R.
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Please reply to me
To:     Recipients <Dailborh@vger.kernel.org>
Date:   Wed, 25 Nov 2020 18:47:35 +0000
Reply-To: dailrrob.83@gmail.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I'm Dailborh R. from US. I picked interest in you and I would like to know
more about you and establish relationship with you. i will wait for
your response. thank you.

