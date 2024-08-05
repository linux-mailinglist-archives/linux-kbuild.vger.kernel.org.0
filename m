Return-Path: <linux-kbuild+bounces-2818-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF9B94783F
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 11:22:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7DA01F211BD
	for <lists+linux-kbuild@lfdr.de>; Mon,  5 Aug 2024 09:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AFD14F9D4;
	Mon,  5 Aug 2024 09:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyOwCvfO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADD73398B
	for <linux-kbuild@vger.kernel.org>; Mon,  5 Aug 2024 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722849760; cv=none; b=Q6T+kfWChxh3snFOfQbIWa8irUbcc5iE4+/dIJXXrLSTukFCXjlo+0HhuzpaMbS1N3SHAPsaDhQZUpX2w+c9HBz0h4x4yOU0oYQe67X8q9kkEMoX2K7JtvdMkwpwqlJyZf8J2HO/gQ5AQjqsuCXR8Mwxao/OUaD+W7xbzYUK9tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722849760; c=relaxed/simple;
	bh=RNt7467t59reJJ9TsUyPVqHux3gbzNGxcp7CHRuxwvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJeGiSfxtDXMDdtbi9gv/M2bYCly+WuHTaPBl0GlyM8G/lsyQEjVFzlXI0j+U0nfFAg0LVkX6ZDY3c/2cK40eYqeTJo8MFH34FmUAaELpc9w6bSf2tkO1Pg0rroRJj5c/8ufQw0OWl4u0wYasfq6jkWaK8zkf9ABh5KZ64m2lqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dyOwCvfO; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52f01613acbso6537189e87.1
        for <linux-kbuild@vger.kernel.org>; Mon, 05 Aug 2024 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722849757; x=1723454557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TF5TZEidLD4MavlyyOC5NjaLSbReOigmuqt7PIdRnmc=;
        b=dyOwCvfO6QXcNhh99SgdmRS2aQsr7jigCeClQ9Kp7fre9Ls6L/zoVVOY+rhoBMEf2i
         gLFutNectZ+HBiaRc+YJoNZDdAAuurtJ6wQx6+TNmgwFg7x/r0jbLVA9vrbNjauTLOwD
         WcxPonkboOfYrre0Jyxyy9zCgopvfRm75TWgpIfcYC0ZkXBTr6D9qaGnqw9EWdOtK6C+
         ZTPvOkhj31dbcDVJSMaOwx5DYmG+gdBlKj4gLYiV8FLUmS9rDdNBxB+fWTlq1gOxrWt0
         uJEhfD7dZsr8PmLMf9f1SV6/Or3sG9cdNIN858dw8taqtfW1Gi6bOlR9Nc0ocIlp9/Ya
         7jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722849757; x=1723454557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TF5TZEidLD4MavlyyOC5NjaLSbReOigmuqt7PIdRnmc=;
        b=aGB/iftyPpEQlAB/ROQ0zJRYLgVi6Q9udQ8tNZrW4W0er0pnja/9WaqSrr3jHLFqaX
         GuhbwXKWsujfwLRIw7iLCL9ULqdhXBkL4RqnrR9ifhyuyGhUjkp01ICVBrf5RwPrNkuz
         kcfI5FmyHbrkbEJewMZILV4eRN5JtsF4afGfutEQwjSQ+21xs0OnDqeyGI4gzQ2Xl0BZ
         rwMprMChJF95LYhf7APErDuGO66/QdmJ560rfQnxo7YAjmpMBLrL1wX7Z1K8Edfr9hhR
         QtH0CWP+4s4Lh/IHUW2vezgHURNf3CuuxIBan14+/5qpPUIeZ8Oubxp3eotbL9G9bvaA
         OsGA==
X-Gm-Message-State: AOJu0YzkYNXrSRKzPjT6+SjYIM9Z99JXuZQHAhJFJqtbLuMd2F/S8pAg
	Z5IUFUw+pkbbsqSj6oup2NWGcceuROXAO+Czj9GALLaBC6fNazJDSAzhjXmxiKDVw2aRz22DLVG
	Y
X-Google-Smtp-Source: AGHT+IH6CGUvtv6OgeI38NVq3w+aNPFmHUBTP9hKDP+SWBRqOZJlK4U2ymUb6pGpi/HRjsZySFuTow==
X-Received: by 2002:a05:6512:3045:b0:52f:31a:4c08 with SMTP id 2adb3069b0e04-530b8d0a343mr3740659e87.11.1722849756538;
        Mon, 05 Aug 2024 02:22:36 -0700 (PDT)
Received: from localhost (c-9b0ee555.07-21-73746f28.bbcust.telenor.se. [85.229.14.155])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba10e15sm1061476e87.78.2024.08.05.02.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Aug 2024 02:22:36 -0700 (PDT)
From: Anders Roxell <anders.roxell@linaro.org>
To: masahiroy@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH v2] scripts: kconfig: merge_config: config files: add a trailing newline
Date: Mon,  5 Aug 2024 11:22:34 +0200
Message-ID: <20240805092234.1338866-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124236.2895857-1-anders.roxell@linaro.org>
References: <20240802124236.2895857-1-anders.roxell@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When merging files without trailing newlines at the end of the file, two
config fragments end up at the same row if file1.config doens't have a
trailing newline at the end of the file.

file1.config "CONFIG_1=y"
file2.config "CONFIG_2=y"
./scripts/kconfig/merge_config.sh -m .config file1.config file2.config

This will generate a .config looking like this.
cat .config
...
CONFIG_1=yCONFIG_2=y"

Making sure so we add a newline at the end of every config file that is
passed into the script.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 scripts/kconfig/merge_config.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 902eb429b9db..0b7952471c18 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -167,6 +167,8 @@ for ORIG_MERGE_FILE in $MERGE_LIST ; do
 			sed -i "/$CFG[ =]/d" $MERGE_FILE
 		fi
 	done
+	# In case the previous file lacks a new line at the end
+	echo >> $TMP_FILE
 	cat $MERGE_FILE >> $TMP_FILE
 done
 
-- 
2.43.0


